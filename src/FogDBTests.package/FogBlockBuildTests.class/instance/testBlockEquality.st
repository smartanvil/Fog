as yet unclassified
testBlockEquality
	self assert: (session findBlockByTag: 'latest' full: true) equals: (session findBlockByTag: 'latest' full: true)