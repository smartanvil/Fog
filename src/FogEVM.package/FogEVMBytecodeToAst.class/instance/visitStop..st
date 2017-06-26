visiting
visitStop: aFogVMStop
	| stop |
	stop := FogEVMAstStop new.
	stop address: self currentInstruction.
	self scope sequence addStatement: stop