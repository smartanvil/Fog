visiting
visitJump: aFogVMJump
	| jump |
	jump := FogEVMAstJump new.
	jump address: stack pop.
	jump instruction: i.
	self currentScope sequence addStatement: jump