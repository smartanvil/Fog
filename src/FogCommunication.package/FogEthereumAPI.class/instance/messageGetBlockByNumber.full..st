as yet unclassified
messageGetBlockByNumber: aBlockNumber full: aBoolean
	^ FogMessage new
		method: 'eth_getBlockByNumber';
		parameters:
			{(self hexa: aBlockNumber).
			aBoolean};
		yourself