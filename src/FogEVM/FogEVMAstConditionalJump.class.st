Class {
	#name : #FogEVMAstConditionalJump,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'address',
		'condition'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstConditionalJump >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitConditionalJump: self 
]

{ #category : #'as yet unclassified' }
FogEVMAstConditionalJump >> address [
	^ address
]

{ #category : #'as yet unclassified' }
FogEVMAstConditionalJump >> address: aFogEVMAstVariable [ 
	address := aFogEVMAstVariable
]

{ #category : #'as yet unclassified' }
FogEVMAstConditionalJump >> condition [
	^ condition
]

{ #category : #'as yet unclassified' }
FogEVMAstConditionalJump >> condition: aFogEVMAstVariable [ 
	condition := aFogEVMAstVariable
]

{ #category : #testing }
FogEVMAstConditionalJump >> isConditionalJump [
	^ true
]

{ #category : #testing }
FogEVMAstConditionalJump >> isJump [
	^ true
]

{ #category : #testing }
FogEVMAstConditionalJump >> printOn: aStream [
	aStream nextPutAll: '('.
	condition printOn: aStream.
	aStream nextPutAll: ') ifTrue: [ interpreter jumpTo: '.
	address  printOn: aStream.
	aStream nextPutAll: '] '
]
