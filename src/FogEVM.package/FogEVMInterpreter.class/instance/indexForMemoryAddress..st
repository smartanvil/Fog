accessing
indexForMemoryAddress: anAddress
	^ executableMemory
		indexOf: (executableMemory detect: [ :i | i byteNumber = anAddress asBKNumber ])