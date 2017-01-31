as yet unclassified
visitExpressionStatement: aSASTExpressionStatement
	" I don't think i care about the expression node. "
	self assert: aSASTExpressionStatement statements size = 1.
	^ (aSASTExpressionStatement statements at: 1) accept: self