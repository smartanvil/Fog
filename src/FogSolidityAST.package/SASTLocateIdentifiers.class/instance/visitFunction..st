as yet unclassified
visitFunction: aSASTFunction
	aSASTFunction name = 'suicide'
		ifTrue: [ self halt ].
	contexts push: aSASTFunction.
	aSASTFunction parameters variables do: [ :v | v accept: self ].
	aSASTFunction block accept: self.
	aSASTFunction return variables do: [ :v | v accept: self ].
	contexts pop