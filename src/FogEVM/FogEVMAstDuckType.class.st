Class {
	#name : #FogEVMAstDuckType,
	#superclass : #FogEVMAstNode,
	#category : 'FogEVM-Interpreter'
}

{ #category : #printing }
FogEVMAstDuckType >> printOn: aStream [
	aStream nextPutAll: 'Unknown type'
]
