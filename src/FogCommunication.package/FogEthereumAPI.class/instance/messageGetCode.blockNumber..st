as yet unclassified
messageGetCode: anAddress blockNumber: aBlockNumber
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			(self hexa: aBlockNumber)};
		yourself