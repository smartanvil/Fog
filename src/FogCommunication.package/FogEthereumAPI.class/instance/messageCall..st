as yet unclassified
messageCall: aETHCallDefinition
	^ FogMessage new
		method: 'eth_call';
		parameters: {aETHCallDefinition};
		yourself