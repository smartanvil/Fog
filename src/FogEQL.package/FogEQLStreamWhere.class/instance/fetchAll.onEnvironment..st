as yet unclassified
fetchAll: aFogNamedDatasourceProxy onEnvironment: aFogStreamsEnvironment
	^ filter gatherBlockNumbersForDatasource: (aFogNamedDatasourceProxy resolveFor: aFogStreamsEnvironment)