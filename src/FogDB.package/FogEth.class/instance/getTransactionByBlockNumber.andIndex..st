as yet unclassified
getTransactionByBlockNumber: aBlockNumber andIndex: anIndex
	| txjson |
	txjson := self send: (api messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex).
	^ self inflateTransaction: txjson