as yet unclassified
testGetBlockGivesABlock
	self assert: ((eth getBlockByTag: 'latest' full: true) isKindOf: FogBlock)