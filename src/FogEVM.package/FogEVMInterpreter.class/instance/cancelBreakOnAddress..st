as yet unclassified
cancelBreakOnAddress: anAddress
	^ (executableMemory at: (self indexForMemoryAddress: anAddress)) breakpoint: false.