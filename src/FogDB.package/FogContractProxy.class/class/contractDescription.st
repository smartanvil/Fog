as yet unclassified
contractDescription
	^ (self session
		findContractDescriptionByName: self contractDescriptionName
		andVersionHash: self versionHash) 