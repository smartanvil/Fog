visiting
visitJump: aFogVMJump
	| jump |
	jump := FogEVMAstJump new.
	jump address: stack pop.
	jump instruction: self currentInstruction.
	self scope sequence addStatement: jump