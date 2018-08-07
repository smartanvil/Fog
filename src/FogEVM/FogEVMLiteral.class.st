Class {
	#name : #FogEVMLiteral,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#classInstVars : [
		'literals'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'instance creation' }
FogEVMLiteral class >> for: anObject [
	anObject isString
		ifFalse: [ self halt: 'should be a string' ].
	^ self literals
		detect: [ :l | l literalValue = anObject ]
		ifNone: [ self literals
				add:
					(self new
						literalValue: anObject;
						yourself) ]
]

{ #category : #'as yet unclassified' }
FogEVMLiteral class >> literals [
	^ literals ifNil: [ literals := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
FogEVMLiteral >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitLiteral: self 
]

{ #category : #testing }
FogEVMLiteral >> isEVMLiteral [
	^ true 
]

{ #category : #'as yet unclassified' }
FogEVMLiteral >> isEVMMessageSend [
	^ false 
]

{ #category : #'as yet unclassified' }
FogEVMLiteral >> isEVMVariable [
	^ false 
]

{ #category : #'as yet unclassified' }
FogEVMLiteral >> isStorageAccess [
	^ false 
]

{ #category : #testing }
FogEVMLiteral >> literalValue [
	^ value
]

{ #category : #'as yet unclassified' }
FogEVMLiteral >> literalValue: aString [ 
	value := aString
]

{ #category : #printing }
FogEVMLiteral >> printOn: aStream [
	"	aStream nextPutAll: 'L('."

	aStream
		nextPutAll:
			((value beginsWith: '0x')
				ifTrue: [ value copyReplaceAll: '0x' with: '16r' ]
				ifFalse: [ value ])
	"	aStream nextPutAll: ')'"
]
