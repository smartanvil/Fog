visiting
visitJump: aFogVMJump
	| jump |
	jump := FogEVMAstJump new.
	jump address: stack pop.
	self haltIf: [ jump address name = 'CONST-66' ].
	self currentScope sequence addStatement: jump