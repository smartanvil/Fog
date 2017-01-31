as yet unclassified
messageEstimateGas: aETHCallDefinition
	^ FogMessage new
		method: 'eth_estimateGas';
		parameters: {aETHCallDefinition};
		yourself