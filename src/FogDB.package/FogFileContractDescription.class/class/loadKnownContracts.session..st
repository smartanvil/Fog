as yet unclassified
loadKnownContracts: aDirectory session: aSession
	aDirectory entries
		select: [ :b | b basename endsWith: '.sol' ]
		thenCollect: [ :f | aSession findContractDescriptionForFileReference: f ]