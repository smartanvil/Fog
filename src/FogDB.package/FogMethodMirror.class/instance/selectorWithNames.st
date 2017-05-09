accessing
selectorWithNames
	parameters types size = 0
		ifTrue: [ ^ name asSymbol ].
	parameters types size = 1
		ifTrue: [ ^ (name , ':' , (parameters variables at: 1)) asSymbol ].
	^ ((2 to: parameters types size)
		inject: name , ':'
		into: [ :acc :each | acc , 'and:' , (parameters variables at: each) ]) asSymbol