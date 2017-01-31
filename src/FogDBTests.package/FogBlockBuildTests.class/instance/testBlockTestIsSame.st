as yet unclassified
testBlockTestIsSame
	| latestFull latestPartial |
	latestFull := eth getBlockByTag: 'latest' full: true.
	latestPartial := eth getBlockByTag: 'latest' full: false.
	self deny: latestFull equals: latestPartial.
	self assert: (latestFull isTheSameBlockAs: latestPartial).
	self assert: latestFull equals: latestPartial full