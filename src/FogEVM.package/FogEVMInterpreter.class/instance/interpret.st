instruction decoding
interpret
	| i |
	trace := OrderedCollection new.
	stack := Stack new.
	programFinished := false.
	self setInstructionPointerToByte: executableMemory first byteNumber.
	[ self programHasFinished ]
		whileFalse: [ "self haltIf: [ self peekNextNextInstruction isKindOf: FogVMSwap ]."
			i := self fetchNextInstruction.
			trace add: i.
			i accept: self with: nil ]