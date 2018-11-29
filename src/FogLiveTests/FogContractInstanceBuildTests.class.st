Class {
	#name : #FogContractInstanceBuildTests,
	#superclass : #FogArbitraryAddressesTestCase,
	#classVars : [
		'simpleStorage'
	],
	#category : 'FogLiveTests'
}

{ #category : #initialization }
FogContractInstanceBuildTests >> setUp [
	super setUp.
	self timeLimit: 3 minutes.
	simpleStorage ifNil: [ simpleStorage := self createContract ]
	
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractCallSetMethodInTransactionModifiesValue [
	| method transactionReceipt  futureTransactionReceipt mirror |
	self assert: session isNotNil.
	mirror := simpleStorage contract mirror instanceMirror.
	method := mirror methods detect: [ :m | m selector asSymbol = #set: ].
	futureTransactionReceipt := method
		using: session
		applyOn: simpleStorage
		valueWithArguments: {2}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	transactionReceipt := futureTransactionReceipt synchronizeTimeout: 10 minutes.
	self
		assert:
			(mirror
				using: session
				property: #storedData
				on: simpleStorage
				at: #latest)
		equals: 2.
	method := mirror methods detect: [ :m | m selector asSymbol = #get ].
	self
		assert:
			(method
				using: session
				applyOn: simpleStorage
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 2
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractHasConstructor [
	self assert: simpleStorage contract mirror constructor isNotNil
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractHasMethods [
	self assert: simpleStorage contract mirror instanceMirror methods size equals: 6
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractHasSetMethod [
	self
		assert:
			(simpleStorage contract mirror instanceMirror methods
				select: [ :m | m selector asSymbol = #set: ]) size
		equals: 1
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractHasTypes [
	| typeNames |
	typeNames := simpleStorage contract mirror types values collect: #name.
	self assert: (typeNames includes: #address).
	self assert: (typeNames includes: #bool).
	self assert: (typeNames includes: #uint256).
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractMethodSignatureIsJustNameAndParenthesisWithParameters [
	simpleStorage contract mirror instanceMirror methods
		do: [ :method | 
			self assert: ('(' split: method signature) size equals: 2.
			self assert: (')' split: method signature) size equals: 2.
			self assert: ((')' split: method signature) at: 2) isEmpty ]
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractSetMethodModifiesState [
	self
		assert:
			(simpleStorage contract mirror instanceMirror methods
				detect: [ :m | m selector asSymbol = #set: ]) isStateModifier
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractSetMethodSignature [
	self
		assert:
			(simpleStorage contract mirror instanceMirror methods
				allSatisfy: [ :method | 
					('0x' , ((connection web3 sha3_256: method signature) copyFrom: 1 to: 8))
						= (session privateSignatureFor:  method) ])
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractViewerOnSimpleStorageHas3Variables [
	self assert: simpleStorage contract mirror instanceMirror properties size = 5
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractViewerOnSimpleStorageRespectOrder [
	| mirror |
	mirror := simpleStorage contract mirror instanceMirror. 
	self assert: (mirror properties at: 1) name equals: '_owner'.
	self assert: (mirror properties  at: 2) name equals: 'storedData'.
	self assert: (mirror properties at: 3) name equals: 'test2'.

]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractViewerOnSimpleStorageTypes [
	| mirror |
	mirror := simpleStorage contract mirror instanceMirror.
	self assert: (mirror properties at: 1) type name equals: 'address'.
	self assert: (mirror properties at: 2) type name equals: 'uint256'.
	self assert: (mirror properties at: 3) type name equals: 'bool'
]

{ #category : #tests }
FogContractInstanceBuildTests >> testContractViewerOnSimpleStorageValuesAreTheExpected [
	| mirror |
	mirror := simpleStorage contract mirror instanceMirror.

	self
		assert:
			(mirror
				using: session
				property: #_owner
				on: simpleStorage
				at: #latest) value
		equals: self ownerAccountAddress.
	self
		assert:
			(mirror
				using: session
				property: #test2
				on: simpleStorage
				at: #latest) value
		equals: true.
	self
		assert:
			(mirror
				using: session
				property: #storedData
				on: simpleStorage
				at: #latest) value
		equals: 2
]
