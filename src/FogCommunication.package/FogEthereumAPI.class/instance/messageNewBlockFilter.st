as yet unclassified
messageNewBlockFilter
	^ FogMessage new
		method: 'eth_newBlockFilter';
		parameters: {};
		yourself