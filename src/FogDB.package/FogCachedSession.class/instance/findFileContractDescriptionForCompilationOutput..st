access db - contract
findFileContractDescriptionForCompilationOutput: description
	^  self cache 
		detectContractDescriptions: [ :a | a codeMatchesWith: (description at: #runtime) ]
		ifNoneCreate: [ super findFileContractDescriptionForCompilationOutput: description ]