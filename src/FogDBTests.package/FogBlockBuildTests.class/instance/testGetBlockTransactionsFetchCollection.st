as yet unclassified
testGetBlockTransactionsFetchCollection
	self assert: (eth getBlockByTag: 'latest' full: true) parent transactions size isNumber