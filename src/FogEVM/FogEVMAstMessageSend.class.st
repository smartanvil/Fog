Class {
	#name : #FogEVMAstMessageSend,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'receiver',
		'selector',
		'arguments'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstMessageSend >> accept: aFogEVMAstVariableWiperVisitor [
	aFogEVMAstVariableWiperVisitor visitMessageSend: self
]

{ #category : #'as yet unclassified' }
FogEVMAstMessageSend >> arguments [
	^ arguments
]

{ #category : #'as yet unclassified' }
FogEVMAstMessageSend >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
FogEVMAstMessageSend >> isEVMMessageSend [
	^ true
]

{ #category : #printing }
FogEVMAstMessageSend >> printOn: aStream [
	aStream nextPutAll: '( '.
	receiver printOn: aStream.
	arguments size = 0
		ifTrue: [ selector asString printOn: aStream ]
		ifFalse: [ | pieces |
			pieces := (':' split: selector) reject: #isEmpty.
			pieces
				with: arguments
				do: [ :sel :arg | 
					aStream
						nextPutAll: ' ';
						nextPutAll: sel asString;
						nextPutAll: ': '.
					arg printOn: aStream ] ].
	aStream nextPutAll: ' )'
]

{ #category : #'as yet unclassified' }
FogEVMAstMessageSend >> receiver [
	^ receiver
]

{ #category : #'as yet unclassified' }
FogEVMAstMessageSend >> receiver: aFogEVMAstVariable [ 
	receiver := aFogEVMAstVariable
]

{ #category : #'as yet unclassified' }
FogEVMAstMessageSend >> resolve [
	^ receiver isEVMLiteral
		ifTrue: [ (receiver literalValue asBKNumber
				perform: selector
				withArguments: (arguments collect: [ :a | a literalValue asBKNumber ])) asBKHexa ]
		ifFalse: [ nil ]
]

{ #category : #'as yet unclassified' }
FogEVMAstMessageSend >> selector: aString [ 
	selector := aString
]
