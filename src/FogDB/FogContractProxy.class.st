"
Super class of any contract proxy. It defines a mirror access and is realted to a contract bind
"
Class {
	#name : #FogContractProxy,
	#superclass : #FogSessionObject,
	#instVars : [
		'blockReference',
		'instance'
	],
	#classInstVars : [
		'mirror'
	],
	#category : 'FogDB-Domain-Contracts'
}

{ #category : #'generated-mirror-based' }
FogContractProxy class >> constructor [
	^ self subclassResponsibility 
]

{ #category : #accessing }
FogContractProxy class >> constructor: aCollection [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> contractDescription [
	^ (self session
		findContractDescriptionByName: self contractDescriptionName
		andVersionHash: self versionHash) 
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> contractDescriptionName [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> forInstance: aContractInstance [
	^ self forInstance: aContractInstance at: #latest
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> forInstance: aContractInstance at: aBlockTagNumberOrHash [
	^ super new initializeWith: aContractInstance and: aBlockTagNumberOrHash
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> mirror [
	^ mirror ifNil: [ mirror := self resolveMirror ]
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> new [
	self error: ' Only instantiable with ContractBind paramter '
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> newWith: aCollection [
	^ aCollection
		ifEmpty: [ self constructor ]
		ifNotEmpty: [ self constructor: aCollection ]
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> resolveMirror [
	^ self contractDescription mirror
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> versionHash [
	^ self subclassResponsibility 
]

{ #category : #accessing }
FogContractProxy >> blockReference [
	^ blockReference
]

{ #category : #accessing }
FogContractProxy >> blockReference: aBlockTagNumberOrHash [
	blockReference := aBlockTagNumberOrHash
]

{ #category : #'as yet unclassified' }
FogContractProxy >> contractAddress [
	^ instance address
]

{ #category : #'as yet unclassified' }
FogContractProxy >> contractDescription [
	^ self class contractDescription
]

{ #category : #'generated-mirror-based' }
FogContractProxy >> contractDescriptionName [
	^ self class contractDescriptionName
]

{ #category : #initialization }
FogContractProxy >> initializeWith: aContractInstance and: aBlockReference [
	instance := aContractInstance.
	blockReference := aBlockReference
]

{ #category : #initialization }
FogContractProxy >> instance [
	^ instance
]

{ #category : #accessing }
FogContractProxy >> mirror [
	^ self class mirror instanceMirror
]

{ #category : #'as yet unclassified' }
FogContractProxy >> renderer [
	^ (EnmaContractPropertyIterator new source: self) renderer
]

{ #category : #'as yet unclassified' }
FogContractProxy >> resolveFromAccount [
	^ self session applicationAccount 
]
