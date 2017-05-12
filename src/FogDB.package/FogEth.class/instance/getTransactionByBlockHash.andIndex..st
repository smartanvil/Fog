as yet unclassified
getTransactionByBlockHash: aBlockHash andIndex: aTxIndex
	^ self
		send: (api messageGetTransactionByBlockHash: aBlockHash andIndex: aTxIndex)