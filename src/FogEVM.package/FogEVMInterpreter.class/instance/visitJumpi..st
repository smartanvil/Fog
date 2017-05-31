visit - flow
visitJumpi: aFogVMJumpi
	| condition newInstructionPointer jumpDestInstruction |
	newInstructionPointer := stack pop.
	jumpDestInstruction := self peekInstruction: newInstructionPointer.
	condition := self hexaToBoolean: stack pop.
	condition
		ifTrue: [ self
				assert: jumpDestInstruction isValidJumpDestination
				description:
					('{1} is not a valid JUMPI (Conditional JUMP) destination. {2} Instruction founded'
						format:
							{newInstructionPointer.
							jumpDestInstruction}).
			self setInstructionPointerToByte: newInstructionPointer ]