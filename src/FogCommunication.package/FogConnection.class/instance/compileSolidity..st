access db - contract
compileSolidity: sourceCode
	| compilationDictionary |
	compilationDictionary := FogUtils new compileSolidity: sourceCode.
	^ self findFileContractDescriptionForCompilationOutput: compilationDictionary