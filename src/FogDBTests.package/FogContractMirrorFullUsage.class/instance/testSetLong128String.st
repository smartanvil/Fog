tests
testSetLong128String
	| future setString |
	setString := mirror method: #setString:.
	future := FogTransactionMonitorService current
		receiptFor: (setString applyOn: contract valueWithArguments: {('AStringOf128Characters' padRightTo: 128 with: $#)} sender: self ownerAccount).
	future synchronizeTimeout: 10 minutes.
	self
		assert: ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount)
		equals: ('AStringOf128Characters' padRightTo: 128 with: $#)