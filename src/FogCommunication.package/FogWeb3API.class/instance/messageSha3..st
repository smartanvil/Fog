as yet unclassified
messageSha3: aString
	^ FogMessage new
		method: 'web3_sha3';
		parameters: {aString};
		yourself