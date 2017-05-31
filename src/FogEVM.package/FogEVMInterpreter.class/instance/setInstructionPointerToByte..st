as yet unclassified
setInstructionPointerToByte: anInteger
	instructionPointer := executableMemory indexOf: (executableMemory detect: [ :i | i byteNumber = anInteger asBKNumber ])