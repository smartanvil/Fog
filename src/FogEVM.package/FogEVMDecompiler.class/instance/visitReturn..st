visiting
visitReturn: aFogVMReturn
	|  var return |
	var := self memoryAccessfrom: stack pop to: stack pop.
	return := FogEVMAstReturn new.
	return returns: var.
	self currentScope sequence addStatement: return.
	self currentScope finishesAt: i.
	self newScopeWithID: instructionPointer