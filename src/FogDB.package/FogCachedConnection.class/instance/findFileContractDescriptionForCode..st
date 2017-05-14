access db - contract
findFileContractDescriptionForCode: description
	^  self cache 
		detectContractDescriptions: [ :a | a codeMatchesWith: (description at: #runtime) ]
		ifNoneCreate: [ super findFileContractDescriptionForCode: description ]