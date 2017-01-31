as yet unclassified
visitAssignment: aSASTAssignment
	^ ((aSASTAssignment variable accept: self) writtingNodeWith: self)
		value: ((aSASTAssignment variable accept: self) readingAccessWith: self)