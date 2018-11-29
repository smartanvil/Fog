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
		'mirror',
		'contractDescription'
	],
	#category : #'FogLive-Domain-Contracts'
}

{ #category : #'instance creation' }
FogContractProxy class >> constructor: aCollection session: aSession [
	self subclassResponsibility 
]

{ #category : #'instance creation' }
FogContractProxy class >> constructorSession: aSession [
	self subclassResponsibility 
]

{ #category : #accessing }
FogContractProxy class >> contractDescription [
	^ contractDescription
		ifNil: [ contractDescription := (STONReader
				on: self contractDescriptionSton base64Decoded utf8Decoded readStream) next ]
]

{ #category : #'generated-mirror-based' }
FogContractProxy class >> contractDescriptionName [
	^ self contractDescription name
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> contractDescriptionSton [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> forInstance: aContractInstance [
	^ self forInstance: aContractInstance at: #latest
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> forInstance: aContractInstance at: aBlockTagNumberOrHash [
	^ super new initializeWith: aContractInstance and: aBlockTagNumberOrHash
]

{ #category : #accessing }
FogContractProxy class >> mirror [
	^ mirror ifNil: [ mirror := self contractDescription mirror  ]
]

{ #category : #'instance creation' }
FogContractProxy class >> new [
	^ self error: ' Use newWith: session instead '
]

{ #category : #'instance creation' }
FogContractProxy class >> newWith: aCollection withSession: aSession [
	^ aCollection
		ifEmpty: [ self constructorSession: aSession ]
		ifNotEmpty: [ self constructor: aCollection session: aSession ]
]

{ #category : #'instance creation' }
FogContractProxy class >> newWithSession: aSession [
	^ self constructorSession: aSession.
]

{ #category : #'as yet unclassified' }
FogContractProxy class >> resolveFromAccount: aSession [
	^ aSession applicationAccount
]

{ #category : #versions }
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
FogContractProxy >> gtInspeactorInspector: composite [
	<gtInspectorPresentationOrder: 0>
	SmartInspect new
		instance: instance;
		reference: blockReference;
		gtInspeactorInspectorNavigation: composite;
		yourself
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
