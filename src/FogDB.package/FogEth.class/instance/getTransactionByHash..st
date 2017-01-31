as yet unclassified
getTransactionByHash: aTxHash
	^ FogTransaction
		detect: [ :t | t privateTransactionHash = aTxHash ]
		ifNoneCreate: [ :t | t source: (self send: (api messageGetTransactionByHash: aTxHash)) ]