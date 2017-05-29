visiting
visitJump: aFogVMJump
	| newInstructionPointer jumpDestInstruction |
	newInstructionPointer := stack pop.
	jumpDestInstruction := self peekInstruction: newInstructionPointer.
	self
		assert: jumpDestInstruction isValidJumpDestination
		description: ('{1} is not a valid JUMP destination' format: {jumpDestInstruction}).
	self setInstructionPointerToByte: newInstructionPointer