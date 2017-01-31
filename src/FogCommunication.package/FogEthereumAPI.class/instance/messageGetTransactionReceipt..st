as yet unclassified
messageGetTransactionReceipt: aTransactionHash
	^ FogMessage new
		method: 'eth_getTransactionReceipt';
		parameters: {aTransactionHash};
		yourself