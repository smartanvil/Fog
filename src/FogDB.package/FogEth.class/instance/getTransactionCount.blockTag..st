as yet unclassified
getTransactionCount: var1 blockTag: var2
	^ self send: (api messageGetTransactionCount: var1 blockTag: var2)