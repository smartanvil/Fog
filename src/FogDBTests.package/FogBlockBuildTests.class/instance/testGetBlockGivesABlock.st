as yet unclassified
testGetBlockGivesABlock
	self assert: ((connection findBlockByTag: 'latest' full: true) isKindOf: FogBlock)