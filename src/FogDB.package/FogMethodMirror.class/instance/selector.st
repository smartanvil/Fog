accessing
selector
	parameters types size = 0
		ifTrue: [ ^ name asSymbol ].
	parameters types size = 1
		ifTrue: [ ^ (name , ':') asSymbol ].
	^ ((2 to: parameters types size) inject: name , ':' into: [ :acc :each | acc , 'and:' ]) asSymbol