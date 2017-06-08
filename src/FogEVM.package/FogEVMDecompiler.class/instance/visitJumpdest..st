visiting
visitJumpdest: aFogVMJumpdest
	| jumpTag |
	jumpTag := FogEVMAstJumpTag new.
	jumpTag address: i byteNumber.
	self currentScope sequence addStatement: jumpTag