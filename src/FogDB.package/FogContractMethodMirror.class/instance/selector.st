as yet unclassified
selector
	parameters size = 0
		ifTrue: [ ^ name asSymbol ].
	parameters size = 1
		ifTrue: [ ^ (name , ':') asSymbol ].
	self error: 'not yet implemented'