Class {
	#name : #FogEVMAstScoper,
	#superclass : #Object,
	#instVars : [
		'currentScope',
		'scopes',
		'workingOn',
		'lookUpTable',
		'decompiledMethods'
	],
	#category : 'FogEVM-Decompiler'
}

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> declareMethods [
	decompiledMethods := lookUpTable associations
		collect: [ :a | 
			| visitor |
	
			visitor := FogEVMAstMethodBuilderVisitor new
				selector: a key literalValue;
				fromNode: (a value at: #startNode);
				toNode: (a value at: #endNode);
				yourself.
			visitor extractFrom: workingOn.
			FogEVMAstUneededJumpsWiper new wipeJumpsFrom: visitor method.
			visitor method ]
]

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> extractMethodLookup [
	| extractor |
	extractor := FogEVMMethodLookUpExtractor new.
	workingOn accept: extractor.
	lookUpTable := extractor lookUpTable
]

{ #category : #initialization }
FogEVMAstScoper >> initialize [
	super initialize.
	scopes := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> methods [
^ decompiledMethods 
]

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> scope: aFogEVMAstScope [
	workingOn := aFogEVMAstScope.
	self extractMethodLookup.
	self declareMethods
]

{ #category : #visiting }
FogEVMAstScoper >> visitAssignation: aFogEVMAssignation [
	
]

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> visitConditionalJump: aFogEVMAstConditionalJump [ 
	currentScope sequence addStatement: aFogEVMAstConditionalJump
]

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> visitJump: aFogEVMAstJump [
	currentScope sequence addStatement: aFogEVMAstJump
]

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> visitJumpTag: aFogEVMAstJumpTag [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> visitMemoryStore: aFogEVMAstMemoryStore [ 
	currentScope sequence addStatement: aFogEVMAstMemoryStore.
]

{ #category : #'as yet unclassified' }
FogEVMAstScoper >> visitScope: aFogEVMAstScope [
	aFogEVMAstScope sequence accept: self
]

{ #category : #visiting }
FogEVMAstScoper >> visitSequence: aFogEVMSequence [
	currentScope := FogEVMAstScope new. 
	scopes add: currentScope. 
	aFogEVMSequence statements do: [ :s | s ifNotNil: [ s accept: self  ] ]
]
