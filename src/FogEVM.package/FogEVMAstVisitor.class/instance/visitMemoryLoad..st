visiting
visitMemoryLoad: aFogEVMAstMemoryLoad
	self visitAstNode: aFogEVMAstMemoryLoad.
	aFogEVMAstMemoryLoad fromAddress accept: self.
	aFogEVMAstMemoryLoad amountOfBytes accept: self