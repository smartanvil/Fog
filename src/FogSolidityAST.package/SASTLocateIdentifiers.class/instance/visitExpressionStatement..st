as yet unclassified
visitExpressionStatement: aSASTExpressionStatement
	aSASTExpressionStatement statements do: [ :s | s accept: self ]