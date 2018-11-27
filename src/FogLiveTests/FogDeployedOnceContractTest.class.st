"
Abstract initialization for mirror based tests
"
Class {
	#name : #FogDeployedOnceContractTest,
	#superclass : #FogArbitraryAddressesTestCase,
	#instVars : [
		'mirror',
		'contract'
	],
	#classInstVars : [
		'contract'
	],
	#category : 'FogDBTests'
}

{ #category : #accessing }
FogDeployedOnceContractTest class >> contract [
	^ contract
]

{ #category : #accessing }
FogDeployedOnceContractTest class >> contract: aTestinContract [
	contract := aTestinContract
]

{ #category : #initialization }
FogDeployedOnceContractTest >> setUp [
	super setUp.
	self timeLimit: 3 minutes.
	self class contract
		ifNil: [ contract := self createContract.
			contract waitIsReady.
			self class contract: contract ].
	contract := self class contract.
	mirror := contract mirror
]
