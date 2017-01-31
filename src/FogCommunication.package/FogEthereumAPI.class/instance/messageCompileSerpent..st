as yet unclassified
messageCompileSerpent: aSourceCodeString 
^ FogMessage new
		method: 'eth_compileSerpent';
		parameters: {aSourceCodeString};
		yourself