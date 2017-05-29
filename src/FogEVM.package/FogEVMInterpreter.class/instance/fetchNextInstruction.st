as yet unclassified
fetchNextInstruction
	| instruction |
	instruction := (executableMemory at: instructionPointer) .
	instructionPointer := instructionPointer + 1.
	^ instruction