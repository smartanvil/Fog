as yet unclassified
messageGetBlockTransactionCountByHash: aBlockHashID
	^ FogMessage new
		method: 'eth_getBlockTransactionCountByHash';
		parameters: {aBlockHashID};
		yourself