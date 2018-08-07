Class {
	#name : #FogEVMAstReturn,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'returns'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstReturn >> accept: aFogEVMAstVariableWiperVisitor [
	aFogEVMAstVariableWiperVisitor visitReturn: self
]

{ #category : #testing }
FogEVMAstReturn >> isEndingState [
	^ true
]

{ #category : #printing }
FogEVMAstReturn >> printOn: aStream [
	aStream
		nextPutAll: String crlf;
		nextPutAll: '^ '.
	returns printOn: aStream.
	aStream nextPutAll: String crlf
]

{ #category : #'as yet unclassified' }
FogEVMAstReturn >> returns [
	^ returns
]

{ #category : #'as yet unclassified' }
FogEVMAstReturn >> returns: aFogEVMAstVariable [ 
	returns := aFogEVMAstVariable
]
