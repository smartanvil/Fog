as yet unclassified
messageNewPendingTransactionFilter
	^ FogMessage new
		method: 'eth_newPendingTransactionFilter';
		parameters: {};
		yourself