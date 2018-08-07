Class {
	#name : #FogEVMAstBinaryMessageSend,
	#superclass : #FogEVMAstMessageSend,
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstBinaryMessageSend >> argument [
	^ arguments at: 1
]

{ #category : #'as yet unclassified' }
FogEVMAstBinaryMessageSend >> argument: anArgument [
	self arguments: {anArgument}
]

{ #category : #printing }
FogEVMAstBinaryMessageSend >> printOn: aStream [
	aStream nextPutAll: '( '.
	receiver printOn: aStream.
	aStream nextPutAll: ' ' , selector asString , ' '.
	self argument printOn: aStream.
	aStream nextPutAll: ') '
]
