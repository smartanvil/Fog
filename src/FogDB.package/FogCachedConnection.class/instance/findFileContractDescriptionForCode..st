access db - contract
findFileContractDescriptionForCode: description
	^  self cache 
		detectContractDescriptions: [ :a | a codeMatchesWith: (description at: #binaryRuntime) ]
		ifNoneCreate: [ super findFileContractDescriptionForCode: description ]