visit - comparision
visitLt: aFogVMGt
	| element1 element2 |
	element1 := stack pop asBKNumber.
	element2 := stack pop asBKNumber.
	stack
		push:
			(element1 < element2
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]) asBKHexa