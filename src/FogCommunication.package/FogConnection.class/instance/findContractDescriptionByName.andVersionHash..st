access db - contract
findContractDescriptionByName: aContractDescriptionName andVersionHash: aVersionHash
	| entry |
	entry := {aContractDescriptionName asFileReference.
	(FileLocator contractsFolder / (aContractDescriptionName , '.sol'))} select: [ :f | f exists ] thenCollect: [ :f | self findContractDescriptionForFileReference: f ].
	^ entry
		detect: [ :c | c versionHash = aVersionHash ]
		ifNone: [ self error: ' cannot found the contract file for: ' , aContractDescriptionName , '  It is not a valid contract name or file path' ]