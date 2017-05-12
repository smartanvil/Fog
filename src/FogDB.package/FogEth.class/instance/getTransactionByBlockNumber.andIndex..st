as yet unclassified
getTransactionByBlockNumber: aBlockNumber andIndex: anIndex
	^ self
		send: (api messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex)