access db - contract
compileSolidity: sourceCode
	| compilationDictionary |
	compilationDictionary := FogUtils new compileSolidity: sourceCode.
	compilationDictionary
		at: #ast
		put: (self astFor: sourceCode and: (compilationDictionary at: #ast)).
	^ self
		findFileContractDescriptionForCompilationOutput: compilationDictionary