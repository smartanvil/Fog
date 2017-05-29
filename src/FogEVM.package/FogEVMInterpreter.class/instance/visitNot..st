visiting
visitNot: aFogVMNot
	| value |
	value := stack pop asBKNumber.
	stack
		push:
			(value = 0
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]) asBKHexa