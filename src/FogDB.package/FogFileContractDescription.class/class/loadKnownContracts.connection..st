as yet unclassified
loadKnownContracts: aDirectory connection: aConnection
	aDirectory entries
		select: [ :b | b basename endsWith: '.sol' ]
		thenCollect: [ :f | aConnection findContractDescriptionForFileReference: f ]