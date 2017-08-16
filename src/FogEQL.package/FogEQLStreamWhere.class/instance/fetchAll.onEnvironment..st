as yet unclassified
fetchAll: aFogEQLDatasource onEnvironment: aFogStreamsEnvironment
	^ filter gatherBlockNumbersForDatasource: (aFogEQLDatasource resolveFor: aFogStreamsEnvironment)