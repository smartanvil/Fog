as yet unclassified
messageGetBalance: anAccountHash blockTag: aBlockTag
	^ FogMessage new
		method: 'eth_getBalance';
		parameters:
			{anAccountHash.
			aBlockTag};
		yourself