visiting
visitJump: aFogVMJump
	| jump |
	jump := FogEVMAstJump new.
	jump address: stack pop.
	self currentScope sequence addStatement: jump