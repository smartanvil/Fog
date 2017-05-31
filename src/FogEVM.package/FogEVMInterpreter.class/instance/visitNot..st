visit - boolean alebra
visitNot: aFogVMNot
	| value |
	value := self hexaToBoolean: stack pop.
	stack push: (self booleanToHexa: value not)