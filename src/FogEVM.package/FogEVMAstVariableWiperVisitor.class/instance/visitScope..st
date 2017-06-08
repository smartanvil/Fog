visiting
visitScope: aFogEVMAstScope
	currentScope := aFogEVMAstScope.
	aFogEVMAstScope temporaries: (aFogEVMAstScope temporaries select: #isEVMVariable).
	aFogEVMAstScope temporaries do: [ :t | self visitVariableDefinition: t ].
	aFogEVMAstScope sequence accept: self.
	currentScope := nil