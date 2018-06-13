creation
createContractAccountFor: compiledCode and: hashAccount
	^ (self findContractDescriptionForCode: compiledCode) at: hashAccount