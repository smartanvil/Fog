Class {
	#name : #FogEVMAstCallData,
	#superclass : #FogEVMAstNode,
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstCallData >> accept: aFogEVMAstVariableWiperVisitor [
	aFogEVMAstVariableWiperVisitor visitCallData: self
]

{ #category : #printing }
FogEVMAstCallData >> printOn: aStream [
	aStream nextPutAll: 'CallData'
]
