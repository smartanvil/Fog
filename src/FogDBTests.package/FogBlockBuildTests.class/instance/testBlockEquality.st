as yet unclassified
testBlockEquality
	self assert: (connection findBlockByTag: 'latest' full: true) equals: (connection findBlockByTag: 'latest' full: true)