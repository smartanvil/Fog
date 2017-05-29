visiting
visitExp: aFogVMExp
	| value exponent |
	value := stack pop asBKNumber.
	exponent := stack pop asBKNumber.
	stack push: (value ** exponent) asBKHexa