visiting
visitJumpi: aFogVMJumpi
	| condition newInstructionPointerAddress |
	newInstructionPointerAddress := stack pop.
	condition := stack pop.
	condition = 0
		ifFalse: [ self setInstructionPointerToByte: stack pop ]