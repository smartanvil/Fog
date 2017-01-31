as yet unclassified
buildThrow: aCollection
	self assert: (aCollection at: #children) isEmpty.
	^ SASTThrow new