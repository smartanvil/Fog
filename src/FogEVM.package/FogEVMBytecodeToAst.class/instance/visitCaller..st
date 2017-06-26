as yet unclassified
visitCaller: aFogVMCaller
	stack push: (self specialVariableNamed: #CALLER loadedWith: FogEVMAstCaller new)