as yet unclassified
messageUninstallFilterID: aFilterId
	^ FogMessage new
		method: 'eth_uninstallFilter';
		parameters: {(self hexa: aFilterId)};
		yourself