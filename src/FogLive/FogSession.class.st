"
A session works as a facade for accessing the Fog connection, but recovering nice objects, allowing some very basic queries.
A session as well works as a facade for the same domain objects to know about their basic encoding, and it dispatches the messages through the given connection. 
This allows a really nice point of extention, allowin programmers to change some specifities of: 

	- encoding 
	- gas calculation 
	- gas price calculation 
	- caching access to specific objects
	- dispathing to other kind of connections to use other kind of blockchain clients.
	
Each session provides a transaction monitor which allows the usage of futures on transactional calls. 



"
Class {
	#name : #FogSession,
	#superclass : #Object,
	#instVars : [
		'connection',
		'monitor',
		'applicationAccount',
		'packages'
	],
	#category : #'FogLive-Session'
}

{ #category : #accessing }
FogSession >> applicationAccount [
	<doc: 'It returns application account setted up in this session'>
	^ applicationAccount 
]

{ #category : #accessing }
FogSession >> applicationAccount: anAccount [
	<doc: 'It allows the setup of an application account. This account would be used for covering the expenses of the transactions, as used as #from field by default'>
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
		ifTrue: [ self assert: aBlockHash == #latest.
			self
				resolveTransactionalActivation: aMethodMirror
				on: anETHContractInstance
				arguments: aCollection
				from: anAccount
				gas: aGasAmount
				gasPrice: aGasPrice
				amount: anAmount ]
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

{ #category : #'as yet unclassified' }
FogSession >> coinBase [
	<doc: 'It returns the coin base of the related Ethereum client.'>
	^ connection eth coinBase
]

{ #category : #accessing }
FogSession >> connection: aConnection [
	<doc: 'It allows to setup the connection'>
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
				from: anAccount address;
				gas: (self calculateGasForDeploying: aContractDescription with: aConstructor)
					priced: (self calculateGasPriceForDeploying: aContractDescription with: aConstructor);
				value: anAmount;
				data: (self encode: aConstructor for: aContractDescription with: aCollection);
				yourself).
	^ self
		registerInstantiationWithReceipt: transactionHash
		ofContractDescription: aContractDescription
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
	<doc: 'It finalizes a session. This method is mean to be called by the garbage collector. It finalizes the monitor service attached to the session.'>
	super finalize.
	monitor ifNotNil:[ monitor  kill.].
	monitor := nil.
	connection := nil
]

{ #category : #'access db - accounts' }
FogSession >> findAccountByHash: aString blockHash: aBlockHash [
	<doc: 'It returns an already existing Account object or it creates one, pointing to the state at an specific block hash '>
	| block |
	block := self findBlockByHash: aBlockHash full: false.
	^ self findAccountByHash: aString blockNumber: block number
]

{ #category : #'access db - accounts' }
FogSession >> findAccountByHash: aString blockNumber: aBlockNumber [
	<doc: 'It returns an already existing Account object or it creates one, pointing to the state at an specific block number '>
	| compiledCode hashAccount |
	aString ifNil: [ ^ FogAccount nilAccount ].
	hashAccount := aString asAddress.
	compiledCode := self eth getContractCode: hashAccount blockNumber: aBlockNumber.
	^ self createAccountFromCode: compiledCode andHash: hashAccount
]

{ #category : #'access db - accounts' }
FogSession >> findAccountByHash: aString blockTag: aBlockTag [
	<doc: 'It returns an already existing Account object or it creates one, pointing to the state at an specific block tag '>
	| compiledCode hashAccount |
	aString ifNil: [ ^ FogAccount nilAccount ].
	hashAccount := aString asAddress.
	compiledCode := self eth getContractCode: hashAccount blockTag: aBlockTag.
	^ self createAccountFromCode: compiledCode andHash: hashAccount
]

{ #category : #'access db - blocks' }
FogSession >> findBlockByHash: aBlockHash full: aBoolean [
	<doc: 'It returns an already existing Block (fully loaded or not) object or it creates one, for the given block hash '>
	^ self createBlockFor: (self eth getBlockByHash: aBlockHash full: aBoolean) full: aBoolean
]

{ #category : #'access db - blocks' }
FogSession >> findBlockByHashOrNumber: aBlockId full: aBoolean [
	<doc: 'It returns an already existing Block (fully loaded or not) object or it creates one, for the given block hash or number '>
	(aBlockId isString or: [ aBlockId isNil ])
		ifTrue: [ ^ self findBlockByHash: aBlockId asAddress full: aBoolean ].
	aBlockId isNumber
		ifTrue: [ ^ self findBlockByNumber: aBlockId full: aBoolean ].
	FogError signal: ' invalid id ' , aBlockId asString
]

{ #category : #'access db - blocks' }
FogSession >> findBlockByNumber: aBlockBumber full: aBoolean [
	<doc: 'It returns an already existing Block (fully loaded or not) object or it creates one, for the given block number '>
	^ self createBlockFor: (self eth getBlockByNumber: aBlockBumber full: aBoolean) full: aBoolean
]

{ #category : #'access db - blocks' }
FogSession >> findBlockByTag: aTag full: aBoolean [
	<doc: 'It returns an already existing Block (fully loaded or not) object or it creates one, for the given block tag '>
	^ self createBlockFor: (self eth getBlockByTag: aTag full: aBoolean) full: aBoolean
]

{ #category : #'access db - contract' }
FogSession >> findContractDescriptionForBinaryCode: aCode [
	<doc: 'It returns an already existing ContractDescription object or it creates one, pointing to the contract bytecode at the given block number'>
	^ self createContractDescriptionForBinary: aCode
]

{ #category : #'access db - contract' }
FogSession >> findContractInstanceByHash: aContractAddress blockNumber: aBlockNumber [
	<doc: 'It returns an already existing ContractInstance object or it creates one, pointing to the contract state at the given block number'>
	| code description |
	code := self eth getContractCode: aContractAddress blockNumber: aBlockNumber.
	code = '0x'
		ifTrue: [ ^ nil ].
	description := self findContractDescriptionForBinaryCode: code.
	^ description at: aContractAddress
]

{ #category : #'access db - contract' }
FogSession >> findContractInstanceByHash: aContractAddress blockTag: aBlockTag [
	<doc: 'It returns an already existing ContractInstance object or it creates one, pointing to the contract state at the given block tag'>
	| code description |
	code := self eth getContractCode: aContractAddress blockTag: aBlockTag.
	code = '0x'
		ifTrue: [ ^ nil ].
	description := self findContractDescriptionForBinaryCode: code.
	^ self createContractInstanceFor: description at: aContractAddress
]

{ #category : #'access db - external accounts' }
FogSession >> findExternalAccountByHash: aString [
	<doc:
		'It returns an already existing ExternalAccount object or it creates one, pointing to the account state at the given block number. It ensure the ExternalAccount type'>
	| acc |
	acc := self findAccountByHash: aString blockTag: 'latest'.
	self assert: acc isContract not description: ' External account expected '.
	^ acc
]

{ #category : #'access db - blocks' }
FogSession >> findLastBlock [
	<doc: 'It returns an already existing fully loaded Block object or it creates one, for the latest block '>
	| latest |
	latest := self findBlockByTag: #latest full: true.
	latest number = 0
		ifTrue: [ latest := self findBlockByNumber: 4999621 full: true ].
	^ latest
]

{ #category : #'access db - package' }
FogSession >> findPackageNamed: aName [
	<doc: 'It returns Package named as the given name'>
	^ self findPackageReference: aName
]

{ #category : #'access db - package' }
FogSession >> findPackageReference: aReference [
	<doc: 'It returns Package referenced as the given reference '>
	^ packages at: aReference
]

{ #category : #'access db - package' }
FogSession >> findReference: aReference [
	^ aReference resolveWith: self
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByBlockHash: aBlockHash andIndex: aTxIndex [
	<doc: 'It returns the transaction at the given index of an specific block hash'>
	^ self createTransactionFor: (self eth getTransactionByBlockHash: aBlockHash andIndex: aTxIndex)
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByBlockNumber: aBlockNumber andIndex: anIndex [
	<doc: 'It returns the transaction at the given index of an specific block number'>
	^ self createTransactionFor: (self eth getTransactionByBlockNumber: aBlockNumber andIndex: anIndex)
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByBlockTag: aBlockTag andIndex: anIndex [
	<doc: 'It returns the transaction at the given index of an specific block tag'>
	^ self createTransactionFor: (self eth getTransactionByBlockTag: aBlockTag andIndex: anIndex)
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByDescription: aTransactionDescription [
	^ self createTransactionFor: aTransactionDescription
]

{ #category : #'access db - transactions' }
FogSession >> findTransactionByHash: aTransactionHash [
	<doc: 'It returns the transaction at the transaction hash'>
	^ self createTransactionFor: (self eth getTransactionByHash: aTransactionHash)
]

{ #category : #'low-level api - accounts' }
FogSession >> getBalance: anAddress [
	^ (connection eth getBalance: anAddress blockTag: #latest) read0xHexadecimal
]

{ #category : #'low-level api - accounts' }
FogSession >> getBalance: anAddress block: aBlockNumberOrHash [
	^ (connection eth getBalance: anAddress blockNumber: aBlockNumberOrHash) read0xHexadecimal
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
FogSession >> isRegistered: aPackageName [
	^ packages includesKey: aPackageName
]

{ #category : #'access db - package' }
FogSession >> loadPackage: aPackage with: aCode [
	<doc: 'It loades a package object into the session, by using the given source code.'>
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
	<doc: 'It loades a new package object into the session, named as the given name, by using the given source code.'>
	^ self loadPackage: (self createPackage: aName) with: aCode 
]

{ #category : #'access db - package' }
FogSession >> loadPackageForFileReference: aFileReference [
	<doc: 'It loades a new package object into the session, named as the name of a given fileReference, by using the source code in this file reference.'>
	^ self loadPackageForCode: aFileReference readStream upToEnd named: aFileReference basename
]

{ #category : #initialization }
FogSession >> monitor [
	<doc: 'It returns the monitor service of the session'>
	^ monitor
]

{ #category : #'access db - package' }
FogSession >> packages [
	<doc: 'It returns all the available packages'>
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
	| receiptHash |
	receiptHash := connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount address;
				to: anETHContractInstance address;
				gas: aGasAmount priced: aGasPrice;
				value: anAmount;
				data: (self privateEncode: aMethodMirror arguments: aCollection);
				yourself).
	^ self receiptFor: receiptHash
]
