access db - contract
compileSolidity: sourceCode
	| compilationDictionary |
	compilationDictionary := FogUtils new compileSolidity: sourceCode.
	compilationDictionary at: #ast put: (self astFor: sourceCode).
	^ self findFileContractDescriptionForCompilationOutput: compilationDictionary