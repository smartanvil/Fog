as yet unclassified
getTransactionByBlockTag: aBlockTag andIndex: anIndex
	| txjson |
	txjson := self send: (api messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex).
	^ self inflateTransaction: txjson