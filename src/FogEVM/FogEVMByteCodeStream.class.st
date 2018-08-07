"
Stream with utilities to split code 
"
Class {
	#name : #FogEVMByteCodeStream,
	#superclass : #ReadStream,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> indexOfConstructor [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> nextConstructor [
	^ self upToInstructions: self privateConstructorBoundaries
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> nextMethod [
	| content boundaries |
	content := self next: 4.
	boundaries := self privateMethodBoundaries.
	self
		assert: (content collect: #instruction) asArray = boundaries
		description: ' Out of method!  '.
	content := content , (self upToCondition: [: b | b instruction isFinishStatus  ]).
	^ FogEVMMethodBytecodeStream on: content projectedFrom: collection
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> nextMethodLookup [
	^ self
		upToInstructions:
			self privateMethodLookupBoundaries
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> privateConstructorBoundaries [
	^ {FogVMCodecopy instance.
	FogVMPush1 instance0x00.
	FogVMReturn instance}
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> privateMethodBoundaries [
	^ {
	FogVMJumpdest instance.
	FogVMCallvalue instance.
	FogVMPush2 instance0x0002 .
	FogVMJumpi instance }
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> privateMethodLookupBoundaries [
	^ {FogVMJump instance.
	FogVMJumpdest instance.
	FogVMPush2 instance0x0002.
	FogVMJump instance}
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> upToCondition: aCondition [
	(position max: 1) to: readLimit do: [ :idx | 
		(aCondition value: (collection at: idx))
			ifTrue: [ ^ self next: idx - position ] ].
	self error: ' instructions not found '
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> upToInstructions: anArrayOfInstructions [
	| first |
	first := anArrayOfInstructions first.
	(position max: 1) to: readLimit do: [ :idx | 
		(collection at: idx) instruction = first
			ifTrue: [ ((collection copyFrom: idx to: idx + anArrayOfInstructions size - 1)
					collect: #instruction) asArray = anArrayOfInstructions
					ifTrue: [ ^ self next: idx - position + anArrayOfInstructions size -1 ] ] ].
	self error: ' instructions not founded '
]

{ #category : #'as yet unclassified' }
FogEVMByteCodeStream >> upToInstructionsNotIncluded: anArrayOfInstructions [
	| first |
	first := anArrayOfInstructions first.
	(position max: 1) to: readLimit do: [ :idx | 
		(collection at: idx) instruction = first
			ifTrue: [ ((collection copyFrom: idx to: idx + anArrayOfInstructions size - 1) collect: #instruction) asArray = anArrayOfInstructions
					ifTrue: [ ^ self next: idx - position - 1 ] ] ].
	self error: ' instructions not founded '
]
