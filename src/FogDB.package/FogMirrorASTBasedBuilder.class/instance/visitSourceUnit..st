visiting
visitSourceUnit: aSASTSourceUnit
	(aSASTSourceUnit units detect: #isContract) accept: self