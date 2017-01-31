as yet unclassified
messageCompileSolidity: aSourceCodeString
	^ FogMessage new
		method: 'eth_compileSolidity';
		parameters: {aSourceCodeString};
		yourself