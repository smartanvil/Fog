access db - contract
findContractDescriptionForCode: aCode
	^  self cache  detectContractDescriptions: [ :a | a codeMatchesWith: aCode ] ifNoneCreate: [ super findContractDescriptionForCode: aCode ]