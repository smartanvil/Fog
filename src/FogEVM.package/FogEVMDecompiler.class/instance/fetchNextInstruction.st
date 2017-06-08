public
fetchNextInstruction
	| instruction |
	instruction := program at: instructionPointer.
	instructionPointer := instructionPointer + 1.
	^ instruction