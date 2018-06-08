access db - contract
findContractDescriptionByName: aContractDescriptionName andVersionHash: aVersionHash
	^ self cache
		detectContractDescriptions: [ :a | a versionHash = aVersionHash and: [ a name = aContractDescriptionName ] ]
		ifNoneCreate: [ super findContractDescriptionByName: aContractDescriptionName andVersionHash: aVersionHash ]