Class {
	#name : #FogEVMAstAbstractConditionalStructure,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'condition',
		'body'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstAbstractConditionalStructure >> accept: aFogEVMAstUneededJumpsWiper [ 
	aFogEVMAstUneededJumpsWiper visitAbstractConditionalStructure: self 
]

{ #category : #'as yet unclassified' }
FogEVMAstAbstractConditionalStructure >> body [
	^ body
]

{ #category : #'as yet unclassified' }
FogEVMAstAbstractConditionalStructure >> body: aFogEVMAstMethod [ 
	body := aFogEVMAstMethod
]

{ #category : #'as yet unclassified' }
FogEVMAstAbstractConditionalStructure >> condition: aFogEVMAstMessageSend [ 
	condition := aFogEVMAstMessageSend
]

{ #category : #printing }
FogEVMAstAbstractConditionalStructure >> printOn: aStream [
	| write |
	write := '' writeStream.
	write nextPutAll: String crlf.
	body printOn: write.
	aStream nextPutAll: '('.
	condition printOn: aStream.
	aStream nextPutAll: ') ifTrue: [ '.
	aStream nextPutAll: String crlf.
	write contents lines
		do: [ :l | 
			aStream nextPutAll: String tab.
			aStream nextPutAll: l.
			aStream nextPutAll: String crlf ].
	aStream nextPutAll: ']. '.
	aStream nextPutAll: String crlf
]
