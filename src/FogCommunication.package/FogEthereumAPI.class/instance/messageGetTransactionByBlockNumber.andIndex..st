as yet unclassified
messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex
	^ FogMessage new
		method: 'eth_getTransactionByBlockNumberAndIndex';
		parameters:
			{(self hexa: aBlockNumber).
			(self hexa: anIndex)};
		yourself