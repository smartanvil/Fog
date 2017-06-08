visiting
visitJumpi: aFogVMJumpi
	| conditionalJump |
	conditionalJump := FogEVMAstConditionalJump new.
	conditionalJump
		address: stack pop;
		condition: stack pop.
	self currentScope sequence addStatement: conditionalJump.