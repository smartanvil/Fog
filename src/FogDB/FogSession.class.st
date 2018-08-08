Class {
	#name : #FogSession,
	#superclass : #Object,
	#instVars : [
		'connection',
		'monitor',
		'applicationAccount'
	],
	#category : #'FogDB-Session'
}

{ #category : #accessing }
FogSession >> applicationAccount [
	^ applicationAccount 
]

{ #category : #accessing }
FogSession >> applicationAccount: anAccount [
	applicationAccount := anAccount
]

{ #category : #'contract - remote activation' }
FogSession >> apply: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount amount: anAmount [
	^ self
		apply: aMethodMirror
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: (self calculateGasAmountFor: aMethodMirror on: anETHContractInstance)
		gasPrice: (self calculateGasPriceFor: aMethodMirror on: anETHContractInstance)
		amount: anAmount
]

{ #category : #'contract - remote activation' }
FogSession >> apply: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount [
	^ aMethodMirror isStateModifier
		ifTrue: [ self
				resolveTransactionalActivation: aMethodMirror
				on: anETHContractInstance
				arguments: aCollection
				from: anAccount
				gas: aGasAmount
				gasPrice: aGasPrice
				amount: anAmount ]
		ifFalse: [ self
				resolveFunctionalActivation: aMethodMirror
				on: anETHContractInstance
				arguments: aCollection
				from: anAccount
				gas: aGasAmount
				gasPrice: aGasPrice
				amount: anAmount ]
]

{ #category : #'contract - remote activation' }
FogSession >> apply: aMethodMirror on: anETHContractInstance at: aBlockHash arguments: aCollection from: anAccount amount: anAmount [
	^ self
		apply: aMethodMirror
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		gas: (self calculateGasAmountFor: aMethodMirror on: anETHContractInstance)
		gasPrice: (self calculateGasPriceFor: aMethodMirror on: anETHContractInstance)
		amount: anAmount
]

{ #category : #'contract - remote activation' }
FogSession >> apply: aMethodMirror on: anETHContractInstance at: aBlockHash arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount [
	^ aMethodMirror isStateModifier
		ifTrue: [ self error: ' Selective block method activation is only available for querying methods' ]
		ifFalse: [ self
				resolveAtBlock: aBlockHash
				functionalActivation: aMethodMirror
				on: anETHContractInstance
				arguments: aCollection
				from: anAccount
				gas: aGasAmount
				gasPrice: aGasPrice
				amount: anAmount ]
]

{ #category : #'access db - contract' }
FogSession >> astFor: sourceCode [
	^ SolidityParser parseStream: sourceCode readStream
]

{ #category : #'contract activation gas calculation' }
FogSession >> calculateGasAmountFor: aMethodMirror on: anETHContractInstance [
	^ 300000
]

{ #category : #'contract activation gas calculation' }
FogSession >> calculateGasForDeploying: aContractDescription with: aConstructor [
	^ 3000000
]

{ #category : #'contract activation gas calculation' }
FogSession >> calculateGasPriceFor: aMethodMirror on: anETHContractInstance [
	^ 60
]

{ #category : #'contract activation gas calculation' }
FogSession >> calculateGasPriceForDeploying: aContractDescription with: aConstructor [
	^ 60
]

{ #category : #'access db - contract' }
FogSession >> compileSolidity: sourceCode [
	| compilationDictionary |
	compilationDictionary := FogUtils new compileSolidity: sourceCode.
	compilationDictionary at: #ast put: (self astFor: sourceCode).
	^ self findFileContractDescriptionForCompilationOutput: compilationDictionary
]

{ #category : #'access db - blocks' }
FogSession >> connection: aConnection [
	connection := aConnection
]

{ #category : #creation }
FogSession >> createAccountFromCode: compiledCode andHash: hashAccount [
	^ compiledCode
		ifNotNil: [ self createContractAccountFor: compiledCode and: hashAccount ]
		ifNil: [ self createExternalAccountFor: hashAccount ]
]

{ #category : #creation }
FogSession >> createBlockFor: dataSource full: isFull [
	dataSource ifNil: [ FogError signalInvalidBlockAccess ].
	^ FogBlock new
		source: dataSource;
		session: self;
		full: isFull;
		yourself
]

{ #category : #creation }
FogSession >> createContractAccountFor: compiledCode and: hashAccount [
	^ (self findContractDescriptionForBinaryCode: compiledCode) at: hashAccount 
]

{ #category : #creation }
FogSession >> createContractBindFor: aFogFileContractDescription at: aContractAddress [
	^ FogContractInstance new
		address: aContractAddress;
		contract: aFogFileContractDescription;
		session: self;
		yourself
]

{ #category : #creation }
FogSession >> createContractDescriptionFor: aCode [
	^ FogContractDescription new
		name: 'Unknown Contract';
		binary: aCode;
		yourself
]

{ #category : #creation }
FogSession >> createContractDescriptionForBinary: aCode [
	^ FogContractDescription new
		name: 'Unknown Contract';
		binary: aCode;
		yourself
]

{ #category : #creation }
FogSession >> createContractInstanceFor: aFogFileContractDescription at: aContractAddress [
	^ FogContractInstance new
		address: aContractAddress;
		contract: aFogFileContractDescription;
		session: self;
		yourself
]

{ #category : #creation }
FogSession >> createExternalAccountFor: hashAccount [
	^ (FogExternalAccount for: hashAccount)
		session: self;
		yourself
]

{ #category : #creation }
FogSession >> createFileContractDescriptionFor: description [
	^ FogFileContractDescription new
		binary: (description at: #binary);
		runtime: (description at: #runtime);
		abi: (description at: #abi);
		ast: (description at: #ast);
		yourself
]

{ #category : #creation }
FogSession >> createTransactionFor: dataSource [
	^ FogTransaction new
		source: dataSource;
		session: self;
		yourself
]

{ #category : #'encode decode' }
FogSession >> decode: aContent type: aType [
	^ aType unpack: aContent using: self hexadecimalPacker
]

{ #category : #'encode decode' }
FogSession >> decodeStream: aContent type: aType [
	^ aType unpackStream: aContent using: self hexadecimalPacker
]

{ #category : #'contract - deploying' }
FogSession >> deploy: aContractDescription applying: aConstructor arguments: aCollection from: anAccount amount: anAmount [
	| transactionHash |
	transactionHash := connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount;
				gas: (self calculateGasForDeploying: aContractDescription with: aConstructor)
					priced: (self calculateGasPriceForDeploying: aContractDescription with: aConstructor);
				value: anAmount;
				data: (self encode: aConstructor for: aContractDescription with: aCollection);
				yourself).
	^ self registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription
]

{ #category : #'contract - deploying' }
FogSession >> deploy: aContractDescription applying: aConstructor arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount [
	| transactionHash |
	transactionHash := connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount address;
				gas: aGasAmount priced: aGasPrice;
				value: anAmount;
				data: (self encode: aConstructor for: aContractDescription with: aCollection);
				yourself).
	^ self
		registerInstantiationWithReceipt: transactionHash
		ofContractDescription: aContractDescription
]

{ #category : #'contract - deploying' }
FogSession >> encode: aConstructor for: aContractDescription with: aCollection [
	^ aContractDescription binary , (self encodeArguments: aCollection for: aConstructor)
]

{ #category : #'contract - remote activation private' }
FogSession >> encodeArguments: aCollection for: aMethodMirror [
	^ aMethodMirror parameters pack: aCollection with: self hexadecimalPacker
]

{ #category : #initialization }
FogSession >> ensureMonitor [
	| monitors |
	(monitor isNotNil and: [ monitor isRunning ])
		ifFalse: [ monitors := Set new.
			monitor
				ifNotNil: [ monitor isRunning
						ifFalse: [ monitors addAll: monitor monitors.
							monitor kill.
							monitor := nil ] ].
			monitor := FogTransactionMonitorService new
				monitors: monitors;
				session: self;
				start;
				yourself ].
	^ monitor
]

{ #category : #'access db - blocks' }
FogSession >> eth [
	^ connection eth
]

{ #category : #'access db - contract accounts' }
FogSession >> fetchSlot: aSlotId onContract: aContractAddress [
	^ connection eth getStorageAt: aContractAddress upTo: aSlotId blockTag: #latest
]

{ #category : #'access db - contract accounts' }
FogSession >> fetchSlot: aSlotId onContract: aContractAddress at: aBlockTagOrNumberOrHash [
	^ connection eth getStorageAt: aContractAddress address upTo: aSlotId block: aBlockTagOrNumberOrHash
]

{ #category : #'access db - contract accounts' }
FogSession >> fetchSlot: aSlotId onContract: aContractAddress atBlock: aBlockHashOrNumber [
	^ connection eth getStorageAt: aContractAddress upTo: aSlotId blockNumber: aBlockHashOrNumber
]

{ #category : #finalization }
FogSession >> finalize [
	super finalize.
	monitor ifNotNil:[ monitor  kill.].
	monitor := nil.
	connection := nil
]

{ #category : #'access db - accounts' }
FogSession >> findAccountByHash: aString blockHash: aBlockHash [
	| block |
	block := self findBlockByHash: aBlockHash full: false.
	^ self findAccountByHash: aString blockNumber: block number
]

{ #category : #'access db - accounts' }
FogSession >> findAccountByHash: aString blockNumber: aBlockNumber [
	| compiledCode hashAccount  |
	aString ifNil: [ ^ FogAccount nilAccount ].
	hashAccount := aString asAddress.
	compiledCode := self eth getContractCode: hashAccount blockNumber: aBlockNumber.
	^ self createAccountFromCode: compiledCode andHash: hashAccount
]

{ #category : #'access db - accounts' }
FogSession >> findAccountByHash: aString blockTag: aBlockTag [
	| compiledCode hashAccount  |
	aString ifNil: [ ^ FogAccount nilAccount ].
	hashAccount := aString asAddress.
	compiledCode := self eth getContractCode: hashAccount blockTag: aBlockTag.
	^ self createAccountFromCode: compiledCode andHash: hashAccount
]

{ #category : #'access db - blocks' }
FogSession >> findBlockByHash: aBlockHash full: aBoolean [
	^ self createBlockFor: (self eth getBlockByHash: aBlockHash full: aBoolean) full: aBoolean
]

{ #category : #'access db - blocks' }
FogSession >> findBlockByNumber: aBlockBumber full: aBoolean [
	^ self createBlockFor: (self eth getBlockByNumber: aBlockBumber full: aBoolean) full: aBoolean
]

{ #category : #'access db - blocks' }
FogSession >> findBlockByTag: aTag full: aBoolean [
	^ self createBlockFor: (self eth getBlockByTag: aTag full: aBoolean) full: aBoolean
	
]

{ #category : #'access db - contract accounts' }
FogSession >> findContractAccountByHash: aString blockHash: aHash [
	| acc |
	acc := self findAccountByHash: aString blockHash: aHash.
	self assert: acc isContract description: ' Contract account expected '.
	^ acc
]

{ #category : #'access db - contract accounts' }
FogSession >> findContractAccountByHash: aString blockNumber: aBlockNumber [
	| acc |
	acc := self findAccountByHash: aString blockNumber: aBlockNumber.
	self assert: acc isContract description: ' Contract account expected '.
	^ acc
]

{ #category : #'access db - contract accounts' }
FogSession >> findContractAccountByHash: aString blockTag: aBlockTag [
	| acc |
	acc := self findAccountByHash: aString blockTag: aBlockTag.
	self assert: acc isContract description: ' Contract account expected '.
	^ acc
]

{ #category : #'access db - contract' }
FogSession >> findContractDescriptionByName: aContractDescriptionName [
	| entry |
	entry := {aContractDescriptionName asFileReference.
	(FileLocator contractsFolder / aContractDescriptionName).
	(FileLocator contractsFolder / (aContractDescriptionName , '.sol'))}
		select: [ :f | f exists ]
		thenCollect: [ :f | self findContractDescriptionForFileReference: f ].
	^ entry anyOne
]

{ #category : #'access db - contract' }
FogSession >> findContractDescriptionByName: aContractDescriptionName andVersionHash: aVersionHash [
	| entry |
	entry := {aContractDescriptionName asFileReference.
	(FileLocator contractsFolder / (aContractDescriptionName , '.sol'))} select: [ :f | f exists ] thenCollect: [ :f | self findContractDescriptionForFileReference: f ].
	^ entry
		detect: [ :c | c versionHash = aVersionHash ]
		ifNone: [ self error: ' cannot found the contract file for: ' , aContractDescriptionName , '  It is not a valid contract name or file path' ]
]

{ #category : #'access db - contract' }
FogSession >> findContractDescriptionForBinaryCode: aCode [
	^ self createContractDescriptionForBinary: aCode
]

{ #category : #'access db - contract' }
FogSession >> findContractDescriptionForFileReference: aFileReference [
	| compiled |
	compiled := (self findFileContractDescriptionByFileReference: aFileReference) ifNil: [ self compileSolidity: aFileReference ].
	compiled fromFile: aFileReference.
	^ compiled
]

{ #category : #'access db - contract' }
FogSession >> findContractDescriptionForSourceCode: aCode [
	^ self createContractDescriptionSourceFor: aCode
]

{ #category : #'access db - contract' }
FogSession >> findContractInstanceByHash: aContractAddress blockNumber: aBlockNumber [
	| code description |
	code := self eth getContractCode: aContractAddress blockNumber: aBlockNumber.
	code = '0x'
		ifTrue: [ ^ nil ].
	description := self findContractDescriptionForBinaryCode: code.
	^ description at: aContractAddress
]

{ #category : #'access db - contract' }
FogSession >> findContractInstanceByHash: aContractAddress blockTag: aBlockTag [
	| code description |
	code := self eth getContractCode: aContractAddress blockTag: aBlockTag.
	code = '0x'
		ifTrue: [ ^ nil ].
	description := self findContractDescriptionForBinaryCode: code.
	^ self createContractInstanceFor: description at: aContractAddress
]

{ #category : #'access db - external accounts' }
FogSession >> findExternalAccountByHash: aString [ 
	|acc|
	acc :=  self findAccountByHash: aString blockTag: 'latest'.
	self assert: acc isContract not description: ' External account expected '. 
	^ acc
]

{ #category : #'access db - contract' }
FogSession >> findFileContractDescriptionByFileReference: aFileReference [
	^ nil
]

{ #category : #'access db - contract' }
FogSession >> findFileContractDescriptionByName: aString [
	| entry |
	entry := {aString asFileReference.
	(FileLocator contractsFolder / (aString , '.sol'))} detect: [ :f | f exists ] ifNone: [ self error: ' ' , aString , ' is not a valid contract name or file path' ].
	^ self  findContractDescriptionForFileReference: entry
]

{ #category : #'access db - contract' }
FogSession >> findFileContractDescriptionForCompilationOutput: description [
	^ self createFileContractDescriptionFor: description
]

{ #category : #'access db - blocks' }
FogSession >> findLastBlock [
	| latest |
	latest := self findBlockByTag: #latest full: true.
	latest number = 0
		ifTrue: [ latest := self findBlockByNumber: 4999621 full: true ].
	^ latest
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByBlockHash: aBlockHash andIndex: aTxIndex [

	^ self createTransactionFor: (self eth getTransactionByBlockHash: aBlockHash andIndex: aTxIndex)
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByBlockNumber: aBlockNumber andIndex: anIndex [
	^ self
		createTransactionFor: (self eth getTransactionByBlockNumber: aBlockNumber andIndex: anIndex)
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByBlockTag: aBlockTag andIndex: anIndex [
	^ self
		createTransactionFor: (self eth getTransactionByBlockTag: aBlockTag andIndex: anIndex)
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByDescription: aTransactionDescription [
	^ self createTransactionFor: aTransactionDescription
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByHash: aTransactionHash [
	^ self createTransactionFor: (self eth getTransactionByHash: aTransactionHash)
]

{ #category : #'access db - external accounts' }
FogSession >> getBalance: anAddress [
	^ (connection eth getBalance: anAddress blockTag: #latest) asBKNumber
]

{ #category : #'access db - external accounts' }
FogSession >> getBalance: anAddress block: aBlockNumberOrHash [
	^ (connection eth getBalance: anAddress blockNumber: aBlockNumberOrHash) asBKNumber
]

{ #category : #'encode decode' }
FogSession >> hexadecimalPacker [
	^ FogHexadecimalPacker new
]

{ #category : #initialization }
FogSession >> initializeWith: aConnection [
	connection := aConnection.
	self ensureMonitor .
]

{ #category : #initialization }
FogSession >> monitor [
	^ monitor
]

{ #category : #'contract - remote activation private' }
FogSession >> privateDecode: aReturnValue for: aMethodMirror [
	| process |
	aReturnValue = '0x'
		ifTrue: [ self error: 'Empty return!' ].
	process := aReturnValue copyFrom: 3 to: aReturnValue size.
	^ aMethodMirror returnType unpackReturn: process using: self hexadecimalPacker 
]

{ #category : #'contract - remote activation private' }
FogSession >> privateEncode: aMethodMirror arguments: aCollection [
	^ String
		streamContents: [ :str | 
			str
				nextPutAll: (self privateSignatureFor: aMethodMirror);
				nextPutAll: (self encodeArguments: aCollection for: aMethodMirror) ]
]

{ #category : #'contract - remote activation private' }
FogSession >> privateSignatureFor: aMethodMirror [
	^ String
		streamContents: [ :str | 
			str
				nextPutAll: '0x';
				nextPutAll: ((connection web3 sha3_256: aMethodMirror signature) copyFrom: 1 to: 8) ]
]

{ #category : #'contract - deploying' }
FogSession >> receiptFor: aTransactionHash [
	^ self ensureMonitor receiptFor: aTransactionHash
]

{ #category : #'contract - deploying' }
FogSession >> receiptForTransaction: aTransactionHash [
	^ connection eth getTransactionReceipt: aTransactionHash
]

{ #category : #'access db - contract' }
FogSession >> registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription [
	| contractInstance future |
	contractInstance := self createContractBindFor: aContractDescription at: nil.
	future := self receiptFor: transactionHash.
	future onSuccessDo: [ :receipt | contractInstance address: (receipt at: #contractAddress) ].
	^ contractInstance
]

{ #category : #'contract - remote activation private' }
FogSession >> resolveAtBlock: aBlockHash functionalActivation: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount [
	| returnValue |
	returnValue := connection eth
		call:
			(FogCallDefinition new
				from: anAccount address;
				to: anETHContractInstance address;
				gas: aGasAmount priced: aGasPrice;
				data: (self privateEncode: aMethodMirror arguments: aCollection);
				value: anAmount yourself)
		block: aBlockHash.
	^ self privateDecode: returnValue for: aMethodMirror
]

{ #category : #'contract - remote activation private' }
FogSession >> resolveFunctionalActivation: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount [
	^ self
		resolveAtBlock: #latest
		functionalActivation: aMethodMirror
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount
]

{ #category : #'contract - remote activation private' }
FogSession >> resolveTransactionalActivation: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount [
	^ connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount address;
				to: anETHContractInstance address;
				gas: aGasAmount priced: aGasPrice;
				value: anAmount;
				data: (self privateEncode: aMethodMirror arguments: aCollection);
				yourself)
]
