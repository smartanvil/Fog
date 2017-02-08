tests
testSetLong64String
	| future setString |
	setString := mirror method: #setString:.
	future := FogTransactionMonitorService current
		receiptFor: (setString applyOn: contract valueWithArguments: {('AStringOf64Characters' padRightTo: 64 with: $-)} sender: self ownerAccount).
	future synchronizeTimeout: 10 minutes.
	self
		assert: ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount)
		equals: ('AStringOf64Characters' padRightTo: 64 with: $-)