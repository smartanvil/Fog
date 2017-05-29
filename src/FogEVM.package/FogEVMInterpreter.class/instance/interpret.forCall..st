as yet unclassified
interpret: aFogEVMMnemonicContract forCall: aCall
	trace := OrderedCollection new.
	call := aCall.
	executableMemory := aFogEVMMnemonicContract sequence.
	program := aFogEVMMnemonicContract.
	self setInstructionPointerToByte: executableMemory first byteNumber.
	[ self programHasFinished ]
		whileFalse: [ | i |
			"self haltIf: [ self peekNextNextInstruction isKindOf: FogVMSwap ]."
			i := self fetchNextInstruction.
			trace add: i.
			i accept: self with: nil ].
	