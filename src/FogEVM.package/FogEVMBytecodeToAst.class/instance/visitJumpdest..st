visiting
visitJumpdest: aFogVMJumpdest
	| jumpTag |
	jumpTag := FogEVMAstJumpTag new.
	jumpTag address: self currentInstruction byteNumber.
	self scope sequence addStatement: jumpTag