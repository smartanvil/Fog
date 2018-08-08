Class {
	#name : #FogEVMAstJumpTag,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'address'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstJumpTag >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitJumpTag: self 
]

{ #category : #'as yet unclassified' }
FogEVMAstJumpTag >> address [
	^ address
]

{ #category : #'as yet unclassified' }
FogEVMAstJumpTag >> address: anInteger [ 
	address := anInteger
]

{ #category : #testing }
FogEVMAstJumpTag >> isJumpDest [
	^ true 
]

{ #category : #printing }
FogEVMAstJumpTag >> printOn: aStream [
	aStream
		nextPutAll: '" -> ';
		nextPutAll: (address asBKHexa: 8);
		nextPutAll: ' "'
]
