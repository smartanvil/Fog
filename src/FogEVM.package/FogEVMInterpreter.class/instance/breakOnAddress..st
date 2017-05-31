as yet unclassified
breakOnAddress: anAddress
	^ (executableMemory at: (self indexForMemoryAddress: anAddress)) breakpoint: true.