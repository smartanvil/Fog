as yet unclassified
loadKnownContracts: aDirectory
	FogCache current contracts
		addAll:
			(aDirectory entries
				select: [ :b | b basename endsWith: '.sol' ]
				thenCollect: [ :f | self loadCode: f ])