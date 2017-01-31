as yet unclassified
getTransactionByBlockHash: aBlockHash andIndex: aTxIndex
	| txjson |
	txjson := self send: (api messageGetTransactionByBlockHash: aBlockHash andIndex: aTxIndex).
	^ self inflateTransaction: txjson