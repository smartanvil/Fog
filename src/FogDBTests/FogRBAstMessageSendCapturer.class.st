Class {
	#name : #FogRBAstMessageSendCapturer,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'messages'
	],
	#category : #FogDBTests
}

{ #category : #visiting }
FogRBAstMessageSendCapturer >> initialize [
	super initialize .
	messages := OrderedCollection new.
]

{ #category : #accessing }
FogRBAstMessageSendCapturer >> messages [
	^ messages
]

{ #category : #visiting }
FogRBAstMessageSendCapturer >> visitMessageNode: aMessageNode [
	(aMessageNode receiver isVariable and: [ aMessageNode receiver name = #method ])
		ifTrue: [ messages add: aMessageNode selector ].
	super visitMessageNode: aMessageNode
]
