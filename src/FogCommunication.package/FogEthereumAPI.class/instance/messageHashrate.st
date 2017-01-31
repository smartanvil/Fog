as yet unclassified
messageHashrate
	^ FogMessage new
		method: 'eth_hashrate';
		parameters: {};
		yourself