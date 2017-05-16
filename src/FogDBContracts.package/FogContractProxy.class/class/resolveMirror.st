as yet unclassified
resolveMirror
	^ (self connection findContractDescriptionByName: self contractDescriptionName andVersionHash: self versionHash) mirror