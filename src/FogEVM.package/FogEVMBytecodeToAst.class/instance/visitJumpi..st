visiting
visitJumpi: aFogVMJumpi
	| conditionalJump |
	conditionalJump := FogEVMAstConditionalJump new.
	conditionalJump
		address: stack pop;
		condition: stack pop.
	self scope sequence addStatement: conditionalJump.