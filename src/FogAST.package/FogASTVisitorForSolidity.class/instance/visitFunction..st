as yet unclassified
visitFunction: aSASTFunction
	| method |
	method := aSASTFunction isConstant
		ifTrue: [ self createConstantMethodNode ]
		ifFalse: [ self createMethodNode ].
	method arguments: (aSASTFunction parameters accept: self).
	method return: (aSASTFunction return accept: self).
	method body: (aSASTFunction block accept: self).
	^ method