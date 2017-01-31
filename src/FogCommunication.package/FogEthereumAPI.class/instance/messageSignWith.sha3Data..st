as yet unclassified
messageSignWith: anAccount sha3Data: aDataSha
	^ FogMessage new
		method: 'eth_sign';
		parameters:
			{anAccount.
			aDataSha};
		yourself