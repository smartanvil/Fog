as yet unclassified
messageSubmitWork: aCryptoNonce header: aBlockPoWHash digest: aDigest
	^ FogMessage new
		method: 'eth_submitWork';
		parameters:
			{aCryptoNonce.
			aBlockPoWHash.
			aDigest};
		yourself