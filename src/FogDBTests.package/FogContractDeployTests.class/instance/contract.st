as yet unclassified
contract
	^ (FogCache current contracts select: #hasAst) detect: [ :c | c fromFile basename beginsWith: 'simple' ]