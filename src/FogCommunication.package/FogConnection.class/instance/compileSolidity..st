access db - contract
compileSolidity: code
	| compilationDictionary |
	compilationDictionary := FogUtils new compileSolidity: code.
	^ self findFileContractDescriptionForCode: compilationDictionary