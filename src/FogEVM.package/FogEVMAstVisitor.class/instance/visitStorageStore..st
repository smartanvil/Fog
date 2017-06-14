visiting
visitStorageStore: aFogEVMAstStorageStore
	self visitAstNode: aFogEVMAstStorageStore.
	aFogEVMAstStorageStore address accept: self.
	aFogEVMAstStorageStore value accept: self