visiting
visitReturn: aFogVMReturn
	| from to |
	from := stack pop.
	to := stack pop.
	return := memory fetchFrom: from to: to.
	self finishComputation