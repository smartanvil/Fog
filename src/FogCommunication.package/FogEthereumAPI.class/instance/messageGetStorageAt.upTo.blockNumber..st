as yet unclassified
messageGetStorageAt: anAddress upTo: anAmountOfBytes blockNumber: aBlockNumber
	^ FogMessage new
		method: 'eth_getStorageAt';
		parameters:
			{anAddress.
			(self hexa: anAmountOfBytes).
			(self hexa: aBlockNumber)};
		yourself