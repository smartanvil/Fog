visiting
visitSelfdestruct: aFogVMSelfdestruct
	| sd |
	sd := FogEVMAstSelfDestruct new.
	sd account: (self literalOrVariable: stack pop).
	sd instruction: self currentInstruction.
	self scope sequence addStatement: sd