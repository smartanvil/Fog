as yet unclassified
testBlockEquality
	self
		assert: (eth getBlockByTag: 'latest' full: true) equals: (eth getBlockByTag: 'latest' full: true)