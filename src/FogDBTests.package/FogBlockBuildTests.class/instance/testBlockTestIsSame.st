as yet unclassified
testBlockTestIsSame
	| latestFull latestPartial |
	latestFull := session findBlockByTag: 'latest' full: true.
	latestPartial := session findBlockByTag: 'latest' full: false.
	self deny: latestFull equals: latestPartial.
	self assert: (latestFull isTheSameBlockAs: latestPartial).
	self assert: latestFull equals: latestPartial full