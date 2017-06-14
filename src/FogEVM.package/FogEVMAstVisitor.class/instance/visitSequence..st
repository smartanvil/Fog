visiting
visitSequence: aFogEVMSequence
	self visitAstNode: aFogEVMSequence.
	aFogEVMSequence statements do: [ :s | s ifNotNil: [ s accept: self ] ]