as yet unclassified
messageGetFilterLogs: aFilterId
	^ FogMessage new
		method: 'eth_getFilterLogs';
		parameters: {(self hexa: aFilterId)};
		yourself