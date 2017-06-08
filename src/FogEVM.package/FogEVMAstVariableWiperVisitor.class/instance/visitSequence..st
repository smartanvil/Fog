as yet unclassified
visitSequence: aFogEVMSequence
	aFogEVMSequence statements do: [ :s | s ifNotNil: [ s accept: self ] ]