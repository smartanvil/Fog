as yet unclassified
testBlockTestIsSame
	| latestFull latestPartial |
	latestFull := connection findBlockByTag: 'latest' full: true.
	latestPartial := connection findBlockByTag: 'latest' full: false.
	self deny: latestFull equals: latestPartial.
	self assert: (latestFull isTheSameBlockAs: latestPartial).
	self assert: latestFull equals: latestPartial full