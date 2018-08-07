creation
createContractAccountFor: compiledCode and: hashAccount
	^ (self findContractDescriptionForBinaryCode: compiledCode) at: hashAccount 