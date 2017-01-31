as yet unclassified
testGetBlockParentFetchBlock
	self assert: ((eth getBlockByTag: 'latest' full: true) parent isKindOf: FogBlock)