as yet unclassified
getBlockTransactionCountByNumber: var1
	^ self send: (api messageGetBlockTransactionCountByNumber: var1)