access db - contract
findContractDescriptionForBinaryCode: aCode
	^  self cache  detectContractDescriptions: [ :a | a codeMatchesWith: aCode ] ifNoneCreate: [ super findContractDescriptionForBinaryCode: aCode ]