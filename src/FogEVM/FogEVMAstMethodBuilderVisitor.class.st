Class {
	#name : #FogEVMAstMethodBuilderVisitor,
	#superclass : #FogEVMAstVisitor,
	#instVars : [
		'selector',
		'fromNode',
		'toNode',
		'inMethodBody',
		'method',
		'scope',
		'sequence',
		'nextNode',
		'currentStatement',
		'hasEntered',
		'visitedStatements'
	],
	#category : 'FogEVM-Decompiler'
}

{ #category : #visiting }
FogEVMAstMethodBuilderVisitor >> buildConditionalAbstractStructureFor: aConditionalJump [
	| visitor conditionalStructure |
	
	visitedStatements add: aConditionalJump.
	visitor := FogEVMAstScopeBuilderVisitor new
		selector: aConditionalJump address literalValue;
		visited: visitedStatements ;
		fromNode: (self statementFor: aConditionalJump);
		installSequence: sequence; 
		toNode: toNode;
		yourself.
	
	visitor extractFromInstalledSequence.
	conditionalStructure := FogEVMAstAbstractConditionalStructure new.
	conditionalStructure condition: aConditionalJump condition.
	conditionalStructure body: visitor method.
	
	^ conditionalStructure
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> buildConditionalAbstractStructureForThrowing: aFogEVMAstConditionalJump [
	| throw conditionalStructure |
	throw := FogEVMAstMethod new.
	throw sequence addStatement: FogEVMAstThrow new.
	conditionalStructure := FogEVMAstAbstractConditionalStructure new.
	conditionalStructure condition: aFogEVMAstConditionalJump condition.
	conditionalStructure body: throw.
	^ conditionalStructure
]

{ #category : #extraction }
FogEVMAstMethodBuilderVisitor >> extractFrom: aFogEVMAstScope [ 
	scope := aFogEVMAstScope.
	method := FogEVMAstMethod new.
	aFogEVMAstScope accept: self .
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> fromNode: aFogEVMNode [
	fromNode := aFogEVMNode
]

{ #category : #testing }
FogEVMAstMethodBuilderVisitor >> hasNextStatement [
	^ (hasEntered and: [ inMethodBody not ])
		ifTrue: [ false ]
		ifFalse: [ sequence statements size > nextNode ]
]

{ #category : #initialization }
FogEVMAstMethodBuilderVisitor >> initialize [
	super initialize .
	inMethodBody := false. 
	hasEntered := false. 
	visitedStatements := Set new .
	currentStatement := FogEVMAstNode new.
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> installSequence: aFogEVMSequence [
	sequence := aFogEVMSequence.
	self setNextStatement: (self statementFor: fromNode)
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> isErrorHandlingJump: aJump [
	^ aJump address isEVMLiteral and: [ aJump address literalValue asBKNumber = '0x02' asBKNumber ]
]

{ #category : #accessing }
FogEVMAstMethodBuilderVisitor >> method [
	method selector: selector .
	^ method
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> nextStatement [
	currentStatement := sequence statements at: nextNode.
	nextNode := nextNode + 1.
	^ currentStatement
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> selector: aSelector [
	selector := aSelector
]

{ #category : #initialization }
FogEVMAstMethodBuilderVisitor >> setNextStatement: aFogEVMAstJumpTag [
	aFogEVMAstJumpTag ifNil: [ ^ self ].
	(visitedStatements includes: (sequence statements indexOf: aFogEVMAstJumpTag))
		ifTrue: [ inMethodBody := false ]
		ifFalse: [ nextNode := sequence statements indexOf: aFogEVMAstJumpTag ]
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> statementFor: aFogEVMAstJump [
	| address |
	address := aFogEVMAstJump address isEVMLiteral
		ifTrue: [ aFogEVMAstJump address literalValue asBKNumber ]
		ifFalse: [ aFogEVMAstJump address resolve ].
	^ sequence statements
		detect: [ :s | s isJumpDest and: [ s address asBKNumber = address ] ]
		ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> toNode: aFogEVMNode [
	toNode := aFogEVMNode
]

{ #category : #visiting }
FogEVMAstMethodBuilderVisitor >> visitConditionalJump: aConditionalJump [
	inMethodBody
		ifTrue: [ method sequence
				addStatement:
					((self isErrorHandlingJump: aConditionalJump)
						ifTrue: [ self buildConditionalAbstractStructureForThrowing: aConditionalJump ]
						ifFalse: [ self buildConditionalAbstractStructureFor: aConditionalJump ]) ]
]

{ #category : #visiting }
FogEVMAstMethodBuilderVisitor >> visitJump: aJump [
	(self isErrorHandlingJump: aJump)
		ifFalse: [ self visitAstNode: aJump.
			self setNextStatement: (self statementFor: aJump) ].
	visitedStatements add: nextNode
]

{ #category : #visiting }
FogEVMAstMethodBuilderVisitor >> visitScope: aFogEVMAstScope [
	aFogEVMAstScope sequence accept: self
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> visitSelfDestruct: aFogEVMAstSelfDestruct [ 

]

{ #category : #visiting }
FogEVMAstMethodBuilderVisitor >> visitSequence: aFogEVMSequence [
	self installSequence: aFogEVMSequence.
	[ self hasNextStatement ]
		whileTrue: [ | stat |
			stat := self nextStatement.
			self visitSequenceStatement: stat ]
]

{ #category : #visiting }
FogEVMAstMethodBuilderVisitor >> visitSequenceStatement: aFogEVMAstNode [
	aFogEVMAstNode = toNode
		ifTrue: [ inMethodBody := false ].
	inMethodBody := inMethodBody or: [ aFogEVMAstNode = fromNode ].
	inMethodBody
		ifTrue: [ hasEntered := true ].
	inMethodBody
		ifTrue: [ (method sequence statements includes: aFogEVMAstNode)
				ifFalse: [ aFogEVMAstNode isConditionalJump
						ifFalse: [ method sequence addStatement: aFogEVMAstNode ] ] ].
	aFogEVMAstNode accept: self
]

{ #category : #'as yet unclassified' }
FogEVMAstMethodBuilderVisitor >> visited: aCollection [ 
 visitedStatements := aCollection 
]
