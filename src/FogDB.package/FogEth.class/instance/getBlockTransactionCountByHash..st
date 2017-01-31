as yet unclassified
getBlockTransactionCountByHash: var1
	^ self send: (api messageGetBlockTransactionCountByHash: var1)