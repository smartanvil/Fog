as yet unclassified
testGetBlockTransactionsFetchCollection
	self assert: (session findBlockByTag: 'latest' full: true) parent transactions size isNumber