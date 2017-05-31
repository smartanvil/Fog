visit - comparision
visitEq: aFogVMEq
	| element1 element2 max |
	element1 := stack pop.
	element2 := stack pop.
	max := element1 size max: element2 size.
	element1 := element1 padRightTo: max with: $0.
	element2 := element2 padRightTo: max with: $0.
	stack
		push:
			(element1 = element2
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]) asBKHexa