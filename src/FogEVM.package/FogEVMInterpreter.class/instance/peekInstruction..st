as yet unclassified
peekInstruction: anAddress
	^ (executableMemory at: (self indexForMemoryAddress: anAddress)) instruction