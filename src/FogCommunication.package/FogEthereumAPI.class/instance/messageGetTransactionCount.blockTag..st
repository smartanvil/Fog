as yet unclassified
messageGetTransactionCount: anAccountAddress blockTag: aBlockTag
	^ FogMessage new
		method: 'eth_getTransactionCount';
		parameters:
			{anAccountAddress.
			aBlockTag};
		yourself