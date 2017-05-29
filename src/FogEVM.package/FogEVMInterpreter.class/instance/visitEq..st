visiting
visitEq: aFogVMEq
	| element1 element2 |
	element1 := stack pop.
	element2 := stack pop.
	stack
		push:
			(element1 = element2
				ifTrue: [ 1 ]
				ifFalse: [ 0 ])