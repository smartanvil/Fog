as yet unclassified
messageGetUncleByBlockNumber: aBlockNumber andIndex: anIndex
	^ FogMessage new
		method: 'eth_getUncleByBlockNumberAndIndex';
		parameters:
			{(self hexa: aBlockNumber).
			(self hexa: anIndex)};
		yourself