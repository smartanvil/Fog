as yet unclassified
messageGetUncleCountByBlockHash: aBlockHash
	^ FogMessage new
		method: 'eth_getUncleCountByBlockHash';
		parameters: {aBlockHash};
		yourself