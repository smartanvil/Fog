visiting
visitStop: aFogVMStop
	| stop |
	stop := FogEVMAstStop new.
	stop address:  i.
	self currentScope sequence addStatement: stop