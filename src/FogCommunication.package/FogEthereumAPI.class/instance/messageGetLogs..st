as yet unclassified
messageGetLogs: aETHFilterDefinition
	^ FogMessage new
		method: 'eth_getLogs';
		parameters: {aETHFilterDefinition};
		yourself