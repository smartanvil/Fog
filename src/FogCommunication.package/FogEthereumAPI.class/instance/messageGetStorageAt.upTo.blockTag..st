as yet unclassified
messageGetStorageAt: anAddress upTo: anAmountOfBytes blockTag: aBlockTag
	^ FogMessage new
		method: 'eth_getStorageAt';
		parameters:
			{anAddress.
			(self hexa: anAmountOfBytes).
			aBlockTag};
		yourself