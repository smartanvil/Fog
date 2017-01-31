as yet unclassified
messageGetCode: anAddress blockTag: aBlockTag
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			aBlockTag};
		yourself