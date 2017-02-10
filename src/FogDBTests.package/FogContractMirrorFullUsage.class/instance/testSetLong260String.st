tests
testSetLong260String
	| future setString |
	setString := mirror method: #setString:.
	future := FogTransactionMonitorService current
		receiptFor: (setString applyOn: contract valueWithArguments: {('AStringOf256Characters' padRightTo: 260 with: $#)} sender: self ownerAccount).
	future synchronizeTimeout: 10 minutes.
	self
		assert: ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount)
		equals: ('AStringOf256Characters' padRightTo: 260 with: $#)