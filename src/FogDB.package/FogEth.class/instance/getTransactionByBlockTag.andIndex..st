as yet unclassified
getTransactionByBlockTag: aBlockTag andIndex: anIndex
	^ self
		send: (api messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex)