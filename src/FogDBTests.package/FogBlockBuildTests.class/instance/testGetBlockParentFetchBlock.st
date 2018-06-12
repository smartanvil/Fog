as yet unclassified
testGetBlockParentFetchBlock
	self assert: ((session findBlockByTag: 'latest' full: true) parent isKindOf: FogBlock)