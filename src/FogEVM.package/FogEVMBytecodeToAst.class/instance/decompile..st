public
decompile: aFogEVMMnemonicContract
	trace := OrderedCollection new.
	stack := Stack new.
	program := aFogEVMMnemonicContract content copy.
	instructionPointer := 1.
	self newScope. 
	[ self programHasFinished ]
		whileFalse: [ self fetchNextInstruction accept: self with: nil ]