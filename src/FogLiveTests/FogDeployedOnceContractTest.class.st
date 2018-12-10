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
	#category : 'FogLiveTests'
}

{ #category : #accessing }
FogDeployedOnceContractTest class >> contract [
	^ contract
]

{ #category : #accessing }
FogDeployedOnceContractTest class >> contract: aTestinContract [
	contract := aTestinContract
]

{ #category : #accessing }
FogDeployedOnceContractTest class >> reset [
	contract := nil
]

{ #category : #initialization }
FogDeployedOnceContractTest >> setUp [
	super setUp.
	self timeLimit: 3 minutes.
	contract := self createContract.
	contract waitIsReady.
	self class contract: contract.
	contract := self class contract.
	mirror := contract mirror
]
