as yet unclassified
testGetBlockParentFetchBlock
	self assert: ((connection findBlockByTag: 'latest' full: true) parent isKindOf: FogBlock)