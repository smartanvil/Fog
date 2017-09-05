as yet unclassified
createResultStreamFor: aFogEQLDatasource onEnvironment: aFogStreamsEnvironment
	| source index |
	source := aFogEQLDatasource resolveFor: aFogStreamsEnvironment.
	index := (filter gatherBlockNumbersForDatasource: source) readStream.
	^ (FogEQLIndexedResultStream on: source)
		filter: filter;
		index: {index};
		yourself