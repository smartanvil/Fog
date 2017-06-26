visiting
visitIszero: aFogVMIszero
	| variable |
	variable := self binaryMessageSend: #= receiver: stack pop argument: (FogEVMLiteral for: '0x0').
	stack push: variable