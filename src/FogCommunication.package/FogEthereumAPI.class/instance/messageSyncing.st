as yet unclassified
messageSyncing
	^ FogMessage new
		method: 'eth_syncing';
		parameters: {};
		yourself