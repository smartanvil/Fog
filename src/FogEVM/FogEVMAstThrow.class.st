Class {
	#name : #FogEVMAstThrow,
	#superclass : #FogEVMAstNode,
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstThrow >> accept: aFogEVMAstUneededJumpsWiper [ 
	aFogEVMAstUneededJumpsWiper visitThrow: self 
]

{ #category : #printing }
FogEVMAstThrow >> isEndingState [
	^ true
]

{ #category : #printing }
FogEVMAstThrow >> printOn: aStream [
	aStream nextPutAll:' THROW '.
]
