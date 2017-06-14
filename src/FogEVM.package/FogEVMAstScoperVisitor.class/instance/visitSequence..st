visiting
visitSequence: aFogEVMSequence
	currentScope := FogEVMAstScope new. 
	scopes add: currentScope. 
	aFogEVMSequence statements do: [ :s | s ifNotNil: [ s accept: self  ] ]