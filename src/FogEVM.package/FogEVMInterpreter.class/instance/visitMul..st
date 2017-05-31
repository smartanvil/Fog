visit - arithmetics
visitMul: aFogVMMul
	| numberA numberB |
	numberA := stack pop asBKNumber.
	numberB := stack pop asBKNumber.
	stack push: (numberA * numberB) asBKHexa