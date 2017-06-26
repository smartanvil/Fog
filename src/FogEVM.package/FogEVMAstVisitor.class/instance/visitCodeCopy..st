as yet unclassified
visitCodeCopy: aFogEVMAstCodeCopy 

	self visitAstNode: aFogEVMAstCodeCopy.
	aFogEVMAstCodeCopy loadingArea accept: self.
	aFogEVMAstCodeCopy fromInstruction accept: self.
	aFogEVMAstCodeCopy amountOfInstructions accept: self.

