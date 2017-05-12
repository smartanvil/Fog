as yet unclassified
getTransactionByHash: aTxHash
	^ self send: (api messageGetTransactionByHash: aTxHash)