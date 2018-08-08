Class {
	#name : #FogEVMSequence,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'statements'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMSequence >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitSequence: self 
]

{ #category : #'as yet unclassified' }
FogEVMSequence >> addStatement: aFogEVMAssignation [ 
	statements add: aFogEVMAssignation
]

{ #category : #initialization }
FogEVMSequence >> initialize [
	super initialize.
	statements := OrderedCollection new
]

{ #category : #printing }
FogEVMSequence >> printOn: aStream [
	statements
		do: [ :s | 
			s printOn: aStream.
			aStream nextPut: $..
			aStream nextPutAll: String crlf ]
]

{ #category : #removing }
FogEVMSequence >> removeStatement: aFogEVMAssignation [ 
	statements remove: aFogEVMAssignation
]

{ #category : #'as yet unclassified' }
FogEVMSequence >> statements [
	^ statements
]
