Class {
	#name : #FogEVMAstStorageLoad,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'address'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstStorageLoad >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitStorageLoad: self 
]

{ #category : #'as yet unclassified' }
FogEVMAstStorageLoad >> address [
	^ address
]

{ #category : #'as yet unclassified' }
FogEVMAstStorageLoad >> address: aFogEVMAstVariable [ 
	address := aFogEVMAstVariable
]

{ #category : #testing }
FogEVMAstStorageLoad >> isStorageAccess [ 

	^ true 
]

{ #category : #printing }
FogEVMAstStorageLoad >> printOn: aStream [
	aStream nextPutAll: '(storage at: '.
	address printOn: aStream.
	aStream nextPutAll: ')'.
]

{ #category : #'as yet unclassified' }
FogEVMAstStorageLoad >> resolve [
	self shouldBeImplemented.
]
