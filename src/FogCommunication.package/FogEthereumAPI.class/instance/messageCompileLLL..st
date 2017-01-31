as yet unclassified
messageCompileLLL: aLLLSourceCodeString
	^ FogMessage new
		method: 'eth_compileLLL';
		parameters: {aLLLSourceCodeString};
		yourself