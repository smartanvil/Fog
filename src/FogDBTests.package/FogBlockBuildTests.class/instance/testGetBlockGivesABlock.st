as yet unclassified
testGetBlockGivesABlock
	self assert: ((session findBlockByTag: 'latest' full: true) isKindOf: FogBlock)