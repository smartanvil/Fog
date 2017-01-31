as yet unclassified
messageSubmitHashrate: aHashRateIn32BytesHexa clientId: aClientUUID
	^ FogMessage new
		method: 'eth_submitHashrate';
		parameters:
			{aHashRateIn32BytesHexa.
			aClientUUID};
		yourself