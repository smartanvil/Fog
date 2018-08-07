"
This represents a contract instance. With a block chain address (Sooner or later)
"
Class {
	#name : #FogContractInstanceBind,
	#superclass : #FogSessionObject,
	#instVars : [
		'address',
		'contract',
		'account'
	],
	#category : 'FogDB-Domain'
}

{ #category : #'as yet unclassified' }
FogContractInstanceBind class >> collectionSelector [
	^ #contractBinds
]

{ #category : #'as yet unclassified' }
FogContractInstanceBind >> address [
	^ address
]

{ #category : #'as yet unclassified' }
FogContractInstanceBind >> address: aString [ 
	address := aString
]

{ #category : #'as yet unclassified' }
FogContractInstanceBind >> contract [
	^ contract
]

{ #category : #'as yet unclassified' }
FogContractInstanceBind >> contract: anETHContract [ 
	contract := anETHContract
]

{ #category : #accessing }
FogContractInstanceBind >> initialize [
	self error: 'using bind'
]

{ #category : #'as yet unclassified' }
FogContractInstanceBind >> isReady [
	^ address isString
]

{ #category : #'as yet unclassified' }
FogContractInstanceBind >> mirror [
	^ contract mirror instanceMirror
]

{ #category : #accessing }
FogContractInstanceBind >> name [
	^ ' bind ', address  asString 
]

{ #category : #accessing }
FogContractInstanceBind >> proxy [
	^ contract contract forInstance: self
]

{ #category : #'as yet unclassified' }
FogContractInstanceBind >> waitIsReady [
	self isReady ifFalse: [ address synchronizeTimeout: 5 minutes  ]
]
