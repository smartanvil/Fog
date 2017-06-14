visiting
visitMemoryStore: aFogEVMAstMemoryStore
	self visitAstNode: aFogEVMAstMemoryStore.
	aFogEVMAstMemoryStore address accept: self.
	aFogEVMAstMemoryStore value accept: self