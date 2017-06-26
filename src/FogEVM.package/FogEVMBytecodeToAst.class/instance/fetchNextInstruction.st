public
fetchNextInstruction

	instruction := program at: instructionPointer.
	trace add: instruction .
	instructionPointer := instructionPointer + 1.
	^ instruction