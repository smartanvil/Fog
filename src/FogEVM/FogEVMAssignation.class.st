Class {
	#name : #FogEVMAssignation,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'variable',
		'value'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAssignation >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitAssignation: self 
]

{ #category : #printing }
FogEVMAssignation >> printOn: aStream [
	variable name printOn: aStream.
	aStream nextPutAll: ' := '.
	value printOn: aStream
]

{ #category : #accessing }
FogEVMAssignation >> value [
	^ value
]

{ #category : #'as yet unclassified' }
FogEVMAssignation >> value: aClass [ 
	value := aClass
]

{ #category : #'as yet unclassified' }
FogEVMAssignation >> variable [
	^ variable
]

{ #category : #'as yet unclassified' }
FogEVMAssignation >> variable: aFogEVMAstVariable [ 
	variable := aFogEVMAstVariable
]
