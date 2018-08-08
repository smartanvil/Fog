Class {
	#name : #FogEVMAstUneededJumpsWiper,
	#superclass : #FogEVMAstVisitor,
	#instVars : [
		'method',
		'tags',
		'jumps'
	],
	#category : 'FogEVM-Decompiler'
}

{ #category : #visiting }
FogEVMAstUneededJumpsWiper >> initialize [
	super initialize.
	jumps := Set new.
	tags := Set new .
]

{ #category : #accessing }
FogEVMAstUneededJumpsWiper >> method: aMethod [
	method:= aMethod
]

{ #category : #accessing }
FogEVMAstUneededJumpsWiper >> visitAbstractConditionalStructure: aStructure [
	self class new wipeJumpsFrom: aStructure body
]

{ #category : #visiting }
FogEVMAstUneededJumpsWiper >> visitJump: aJump [
	jumps add: aJump
]

{ #category : #visiting }
FogEVMAstUneededJumpsWiper >> visitJumpTag: aTag [
	tags add: aTag
]

{ #category : #'as yet unclassified' }
FogEVMAstUneededJumpsWiper >> visitMethod: aFogEVMAstMethod [ 
	aFogEVMAstMethod sequence accept: self 
]

{ #category : #'as yet unclassified' }
FogEVMAstUneededJumpsWiper >> visitSelfDestruct: aFogEVMAstSelfDestruct [ 
	
]

{ #category : #visiting }
FogEVMAstUneededJumpsWiper >> visitSequence: aFogEVMSequence [
	| previous toWipe |
	toWipe := OrderedCollection new.
	self visitAstNode: aFogEVMSequence.
	aFogEVMSequence statements ifEmpty: [ ^ self ].
	previous := aFogEVMSequence statements first.
	aFogEVMSequence statements
		do: [ :s | 
			(s isJumpDest
				and: [ previous isJump
						and: [ s address literalValue asBKNumber = previous address literalValue asBKNumber ] ])
				ifTrue: [ toWipe
						add: s;
						add: previous ].
			s ifNotNil: [ s accept: self ].
			previous := s ].
	toWipe do: [ :s | aFogEVMSequence removeStatement: s ]
]

{ #category : #'as yet unclassified' }
FogEVMAstUneededJumpsWiper >> visitThrow: aFogEVMAstThrow [ 
	self visitAstNode: aFogEVMAstThrow
]

{ #category : #accessing }
FogEVMAstUneededJumpsWiper >> wipeJumpsFrom: aMethod [
	method := aMethod.
	aMethod accept: self.
	tags
		select: [ :t | 
			(jumps noneSatisfy: [ :j | j address literalValue asBKNumber = t address literalValue asBKNumber ])
				and: [ t ~= aMethod sequence statements first ] ]
		thenDo: [ :t | "method sequence removeStatement: t" ]
]
