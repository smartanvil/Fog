as yet unclassified
programHasFinished
	^ programFinished ifNil: [ programFinished := executableMemory size < instructionPointer ]