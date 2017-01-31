as yet unclassified
messageGetTransactionByBlockHash: aBlockHash andIndex: anIndex
	^ FogMessage new
		method: 'eth_getTransactionByBlockHashAndIndex';
		parameters:
			{aBlockHash.
			(self hexa: anIndex)};
		yourself