Class {
	#name : #FogEVMMethodBytecodeStream,
	#superclass : #ReadStream,
	#instVars : [
		'original'
	],
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogEVMMethodBytecodeStream class >> on: aCollection projectedFrom: aCollection2 [
	^ (self on: aCollection)
		original: aCollection2;
		yourself
]

{ #category : #accessing }
FogEVMMethodBytecodeStream >> next [
	(collection at: position + 1) instruction isStrictJump
		ifTrue: [ self assert: (collection at: position)instruction isPush ].
	^ super next
]

{ #category : #accessing }
FogEVMMethodBytecodeStream >> next: anInteger [
	| cont |
	cont := OrderedCollection new.
	anInteger timesRepeat: [ cont add: self next ].
	^ cont
]

{ #category : #'as yet unclassified' }
FogEVMMethodBytecodeStream >> original: aCollection [
	original := aCollection
]

{ #category : #accessing }
FogEVMMethodBytecodeStream >> upToEnd [
	^ self next: readLimit - position
]
