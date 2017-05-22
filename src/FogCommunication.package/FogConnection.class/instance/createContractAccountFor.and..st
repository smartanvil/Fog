creation
createContractAccountFor: compiledCode and: hashAccount
	^ FogContractAccount for: ((self findContractDescriptionForCode: compiledCode) at: hashAccount) and: hashAccount