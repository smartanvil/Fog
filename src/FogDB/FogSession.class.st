Class {
	#name : #FogSession,
	#superclass : #Object,
	#instVars : [
		'connection',
		'monitor',
		'applicationAccount',
		'packages'
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

{ #category : #'low-level api - contract - remote activation' }
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

{ #category : #'low-level api - contract - remote activation' }
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

{ #category : #'low-level api - contract - remote activation' }
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

{ #category : #'low-level api - contract - remote activation' }
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

{ #category : #'low-level api - contract activation gas calculation' }
FogSession >> calculateGasAmountFor: aMethodMirror on: anETHContractInstance [
	^ 300000
]

{ #category : #'low-level api - contract activation gas calculation' }
FogSession >> calculateGasForDeploying: aContractDescription with: aConstructor [
	^ 3000000
]

{ #category : #'low-level api - contract activation gas calculation' }
FogSession >> calculateGasPriceFor: aMethodMirror on: anETHContractInstance [
	^ 60
]

{ #category : #'low-level api - contract activation gas calculation' }
FogSession >> calculateGasPriceForDeploying: aContractDescription with: aConstructor [
	^ 60
]

{ #category : #accessing }
FogSession >> connection: aConnection [
	connection := aConnection
]

{ #category : #'private - objects creation' }
FogSession >> createAccountFromCode: compiledCode andHash: hashAccount [
	^ compiledCode
		ifNotNil: [ self createContractAccountFor: compiledCode and: hashAccount ]
		ifNil: [ self createExternalAccountFor: hashAccount ]
]

{ #category : #'private - objects creation' }
FogSession >> createBlockFor: dataSource full: isFull [
	dataSource ifNil: [ FogError signalInvalidBlockAccess ].
	^ FogBlock new
		source: dataSource;
		session: self;
		full: isFull;
		yourself
]

{ #category : #'private - objects creation' }
FogSession >> createContractAccountFor: compiledCode and: hashAccount [
	^ (self findContractDescriptionForBinaryCode: compiledCode) at: hashAccount 
]

{ #category : #'private - objects creation' }
FogSession >> createContractBindFor: aFogContractDescription at: aContractAddress [

	^ FogContractInstance new
		address: aContractAddress;
		contract: aFogContractDescription;
		session: self;
		yourself
]

{ #category : #'private - objects creation' }
FogSession >> createContractDescriptionFor: aCode [
	^ FogContractDescription new
		name: 'Unknown Contract';
		binary: aCode;
		yourself
]

{ #category : #'private - objects creation' }
FogSession >> createContractDescriptionForBinary: aCode [
	^ FogContractDescription new
		name: 'Unknown Contract';
		binary: aCode;
		yourself
]

{ #category : #'private - objects creation' }
FogSession >> createContractDescriptionFrom: compilationDictionary [
	^ FogContractDescription new
		binary: (compilationDictionary at: #binary);
		runtime: (compilationDictionary at: #runtime);
		abi: (compilationDictionary at: #abi);
		yourself
]

{ #category : #'private - objects creation' }
FogSession >> createContractInstanceFor: aFogContractDescription at: aContractAddress [
	^ FogContractInstance new
		address: aContractAddress;
		contract: aFogContractDescription;
		session: self;
		yourself
]

{ #category : #'private - objects creation' }
FogSession >> createExternalAccountFor: hashAccount [
	^ (FogExternalAccount for: hashAccount)
		session: self;
		yourself
]

{ #category : #creating }
FogSession >> createPackage: aName [
	^ FogPackage new
		name: aName;
		yourself
]

{ #category : #'private - objects creation' }
FogSession >> createTransactionFor: dataSource [
	^ FogTransaction new
		source: dataSource;
		session: self;
		yourself
]

{ #category : #'private - encoding decoding' }
FogSession >> decode: aContent type: aType [
	^ aType unpack: aContent using: self hexadecimalPacker
]

{ #category : #'private - encoding decoding' }
FogSession >> decodeStream: aContent type: aType [
	^ aType unpackStream: aContent using: self hexadecimalPacker
]

{ #category : #'low-level api - contract - deploying' }
FogSession >> deploy: aContractDescription applying: aConstructor arguments: aCollection from: anAccount amount: anAmount [
	| transactionHash |
	transactionHash := connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount address ;
				gas: (self calculateGasForDeploying: aContractDescription with: aConstructor)
					priced: (self calculateGasPriceForDeploying: aContractDescription with: aConstructor);
				value: anAmount;
				data: (self encode: aConstructor for: aContractDescription with: aCollection);
				yourself).
	^ self registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription
]

{ #category : #'low-level api - contract - deploying' }
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

{ #category : #'low-level api - contract - deploying' }
FogSession >> encode: aConstructor for: aContractDescription with: aCollection [
	^ aContractDescription binary , (self encodeArguments: aCollection for: aConstructor)
]

{ #category : #'private - encoding decoding' }
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

{ #category : #accessing }
FogSession >> eth [
	^ connection eth
]

{ #category : #'low-level api - slots' }
FogSession >> fetchSlot: aSlotId onContract: aContractAddress [
	^ connection eth getStorageAt: aContractAddress upTo: aSlotId blockTag: #latest
]

{ #category : #'low-level api - slots' }
FogSession >> fetchSlot: aSlotId onContract: aContractAddress at: aBlockTagOrNumberOrHash [
	^ connection eth getStorageAt: aContractAddress address upTo: aSlotId block: aBlockTagOrNumberOrHash
]

{ #category : #'low-level api - slots' }
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
FogSession >> findContractDescriptionForBinaryCode: aCode [
	^ self createContractDescriptionForBinary: aCode
]

{ #category : #'access db - contract' }
FogSession >> findContractDescriptionForSourceCode: aCode [
	^ self createContractDescriptionFromSourceCode: aCode
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

{ #category : #'access db - blocks' }
FogSession >> findLastBlock [
	| latest |
	latest := self findBlockByTag: #latest full: true.
	latest number = 0
		ifTrue: [ latest := self findBlockByNumber: 4999621 full: true ].
	^ latest
]

{ #category : #'access db - package' }
FogSession >> findPackageNamed: aName [
	^ self findPackageReference: aName asFogReference
]

{ #category : #'access db - package' }
FogSession >> findPackageReference: aReference [
	^ aReference fetchFrom: packages 
]

{ #category : #'access db - package' }
FogSession >> findReference: aReference [
	^ aReference resolveWith: self
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

{ #category : #'low-level api - accounts' }
FogSession >> getBalance: anAddress [
	^ (connection eth getBalance: anAddress blockTag: #latest) asBKNumber
]

{ #category : #'low-level api - accounts' }
FogSession >> getBalance: anAddress block: aBlockNumberOrHash [
	^ (connection eth getBalance: anAddress blockNumber: aBlockNumberOrHash) asBKNumber
]

{ #category : #'private - encoding decoding' }
FogSession >> hexadecimalPacker [
	^ FogHexadecimalPacker new
]

{ #category : #initialization }
FogSession >> initialize [
	super initialize.
	packages := Dictionary new
]

{ #category : #initialization }
FogSession >> initializeWith: aConnection [
	connection := aConnection.
	packages := Dictionary new.
	self ensureMonitor
]

{ #category : #'access db - package' }
FogSession >> loadPackage: aPackage with: aCode [
	| compilation ast |
	ast := SolidityParser parseStream: aCode readStream.
	aPackage source: aCode.
	aPackage ast: ast.
	compilation := FogUtils new compileSolidityText: aCode.
	compilation
		keysAndValuesDo: [ :k :v | 
			aPackage
				addContractDescription:
					((self createContractDescriptionFrom: v)
						name: k;
						package: aPackage;
						yourself) ].
	self registerPackage: aPackage.
	^ aPackage
]

{ #category : #'access db - package' }
FogSession >> loadPackageForCode: aCode named: aName [ 
	^ self loadPackage: (self createPackage: aName) with: aCode 
]

{ #category : #'access db - package' }
FogSession >> loadPackageForFileReference: aFileReference [
	^ self loadPackageForCode: aFileReference readStream upToEnd named: aFileReference basename
]

{ #category : #initialization }
FogSession >> monitor [
	^ monitor
]

{ #category : #accessing }
FogSession >> packages [
	^ packages
]

{ #category : #'private - encoding decoding' }
FogSession >> privateDecode: aReturnValue for: aMethodMirror [
	| process |
	aReturnValue = '0x'
		ifTrue: [ self error: 'Empty return!' ].
	process := aReturnValue copyFrom: 3 to: aReturnValue size.
	^ aMethodMirror returnType unpackReturn: process using: self hexadecimalPacker 
]

{ #category : #'private - encoding decoding' }
FogSession >> privateEncode: aMethodMirror arguments: aCollection [
	^ String
		streamContents: [ :str | 
			str
				nextPutAll: (self privateSignatureFor: aMethodMirror);
				nextPutAll: (self encodeArguments: aCollection for: aMethodMirror) ]
]

{ #category : #'private - convenient' }
FogSession >> privateSignatureFor: aMethodMirror [
	^ String
		streamContents: [ :str | 
			str
				nextPutAll: '0x';
				nextPutAll: ((connection web3 sha3_256: aMethodMirror signature) copyFrom: 1 to: 8) ]
]

{ #category : #'low-level api - contract - deploying' }
FogSession >> receiptFor: aTransactionHash [
	^ self ensureMonitor receiptFor: aTransactionHash
]

{ #category : #'low-level api - contract - deploying' }
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

{ #category : #'access db - package' }
FogSession >> registerPackage: aPackage [
	packages at: aPackage name asSymbol put: aPackage
]

{ #category : #'low-level api - contract - remote activation private' }
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

{ #category : #'low-level api - contract - remote activation private' }
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

{ #category : #'low-level api - contract - remote activation private' }
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
