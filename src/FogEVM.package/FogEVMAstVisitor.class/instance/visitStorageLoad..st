visiting
visitStorageLoad: aFogEVMAstStorageLoad
	self visitAstNode: aFogEVMAstStorageLoad.
	aFogEVMAstStorageLoad address accept: self