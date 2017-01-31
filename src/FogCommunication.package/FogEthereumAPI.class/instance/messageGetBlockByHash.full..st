as yet unclassified
messageGetBlockByHash: aBlockHashID full: aBoolean
	^ FogMessage new
		method: 'eth_getBlockByHash';
		parameters:
			{aBlockHashID.
			aBoolean};
		yourself