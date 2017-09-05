private
instructionFor: aCode
	| code |
	code := '0x' , aCode.
	^ (FogEVMInstruction allSubclasses detect: [ :c | c byteCode = code ] ifNone:[ FogEVMUnknown ]) instance