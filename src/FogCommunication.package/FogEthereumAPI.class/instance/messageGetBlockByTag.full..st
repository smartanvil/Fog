as yet unclassified
messageGetBlockByTag: aTag full: aBoolean
	^ FogMessage new
		method: 'eth_getBlockByNumber';
		parameters:
			{aTag.
			aBoolean};
		yourself