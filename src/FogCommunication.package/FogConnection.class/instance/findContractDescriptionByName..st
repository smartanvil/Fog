access db - contract
findContractDescriptionByName: aContractDescriptionName 
	| entry |
	entry := {aContractDescriptionName asFileReference.
	(FileLocator contractsFolder / (aContractDescriptionName , '.sol'))} select: [ :f | f exists ] thenCollect: [ :f | self findContractDescriptionForFileReference: f ].
	^ entry anyOne