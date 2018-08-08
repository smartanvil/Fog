Class {
	#name : #FogEVMAstMethod,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'arguments',
		'sequence',
		'selector'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstMethod >> accept: aFogEVMAstUneededJumpsWiper [ 
	aFogEVMAstUneededJumpsWiper visitMethod: self 
]

{ #category : #initialization }
FogEVMAstMethod >> initialize [
	super initialize. 
	sequence := FogEVMSequence new
]

{ #category : #printing }
FogEVMAstMethod >> printOn: aStream [
	aStream nextPutAll: '>>'. 
	sequence printOn: aStream.
	aStream nextPutAll: String crlf
]

{ #category : #'as yet unclassified' }
FogEVMAstMethod >> selector [
	^ selector
]

{ #category : #'as yet unclassified' }
FogEVMAstMethod >> selector: aString [ 
	selector := aString 
]

{ #category : #'as yet unclassified' }
FogEVMAstMethod >> sequence [
	^ sequence
]
