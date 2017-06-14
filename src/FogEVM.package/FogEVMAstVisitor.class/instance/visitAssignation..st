visiting
visitAssignation: aFogEVMAssignation
	self visitAstNode: aFogEVMAssignation.
	aFogEVMAssignation variable accept: self.
	aFogEVMAssignation value accept: self