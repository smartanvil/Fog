as yet unclassified
getTransactionCount: var1 blockNumber: var2
	^ self send: (api messageGetTransactionCount: var1 blockNumber: var2)