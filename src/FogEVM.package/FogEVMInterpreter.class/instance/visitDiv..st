visit - arithmetics
visitDiv: aFogVMDiv
	| numerator denom |
	numerator := stack pop asBKNumber.
	denom := stack pop asBKNumber.
	stack
		push:
			(numerator isZero
				ifTrue: [ 0 ]
				ifFalse: [ numerator // denom ]) asBKHexa