as yet unclassified
messageGetFilterChanges: aFilterId
	^ FogMessage new
		method: 'eth_getFilterChanges';
		parameters: {(self hexa: aFilterId)};
		yourself