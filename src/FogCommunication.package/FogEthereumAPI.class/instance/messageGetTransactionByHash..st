as yet unclassified
messageGetTransactionByHash: aTransactionHash
	^ FogMessage new
		method: 'eth_getTransactionByHash';
		parameters: {aTransactionHash};
		yourself