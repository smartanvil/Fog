visiting
visitSelfdestruct: aFogVMSelfdestruct
	| sd |
	sd := FogEVMAstSelfDestruct new.
	sd account: (self literalOrVariable: stack pop).
	sd instruction: i.
	self currentScope sequence addStatement: sd