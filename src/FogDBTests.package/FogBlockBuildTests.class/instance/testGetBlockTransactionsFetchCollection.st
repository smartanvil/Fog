as yet unclassified
testGetBlockTransactionsFetchCollection
	self assert: (connection findBlockByTag: 'latest' full: true) parent transactions size isNumber