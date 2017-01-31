as yet unclassified
messageGetBalance: anAccountHash blockNumber: anInteger
	^ FogMessage new
		method: 'eth_getBalance';
		parameters:
			{anAccountHash.
			(self hexa: anInteger)};
		yourself