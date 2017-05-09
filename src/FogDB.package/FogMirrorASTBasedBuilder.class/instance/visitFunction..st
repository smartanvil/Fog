as yet unclassified
visitFunction: aSASTFunction
	aSASTFunction isConstructor
		ifTrue: [ constructor := self createConstructor: aSASTFunction ]
		ifFalse: [ methods add: (self createMethod: aSASTFunction) ]