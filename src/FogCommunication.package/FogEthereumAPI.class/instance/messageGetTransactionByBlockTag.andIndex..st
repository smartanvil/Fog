as yet unclassified
messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex
	^ FogMessage new
		method: 'eth_getTransactionByBlockNumberAndIndex';
		parameters:
			{aBlockTag.
			(self hexa: anIndex)};
		yourself