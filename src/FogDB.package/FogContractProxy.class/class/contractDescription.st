as yet unclassified
contractDescription
	^ (self connection
		findContractDescriptionByName: self contractDescriptionName
		andVersionHash: self versionHash) 