visiting
visitReturn: aFogVMReturn
	|  var return |
	var := self memoryAccessfrom: stack pop to: stack pop.
	return := FogEVMAstReturn new.
	return returns: var.
	self scope sequence addStatement: return.
	self scope finishesAt: self currentInstruction.
