Class {
	#name : #FogEVMAstSelfDestruct,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'account'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstSelfDestruct >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitSelfDestruct: self .
]

{ #category : #'as yet unclassified' }
FogEVMAstSelfDestruct >> account [
	^ account
]

{ #category : #'as yet unclassified' }
FogEVMAstSelfDestruct >> account: aFogEVMAstVariable [ 
	account := aFogEVMAstVariable
]

{ #category : #printing }
FogEVMAstSelfDestruct >> printOn: aStream [
	aStream nextPutAll: 'SELF-DESTRUCT Account: '.
	account printOn: aStream.
	aStream
		nextPutAll: ' I: ';
		nextPutAll: (instruction byteNumber asBKHexa: 8)
]
