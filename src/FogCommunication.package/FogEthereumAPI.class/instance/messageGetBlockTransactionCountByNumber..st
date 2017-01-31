as yet unclassified
messageGetBlockTransactionCountByNumber: aBlockNumber
	^ FogMessage new
		method: 'eth_getBlockTransactionCountByNumber';
		parameters: {(self hexa: aBlockNumber)};
		yourself