access db - contract
findFileContractDescriptionByFileReference: aFileReference
	^ self cache detectFileContractDescriptionsOrNil: [ :a | a fromFile = aFileReference ]