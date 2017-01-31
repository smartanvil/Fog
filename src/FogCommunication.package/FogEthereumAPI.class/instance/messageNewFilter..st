as yet unclassified
messageNewFilter: aETHFilterDefinition
	^ FogMessage new
		method: 'eth_newFilter';
		parameters: {aETHFilterDefinition};
		yourself