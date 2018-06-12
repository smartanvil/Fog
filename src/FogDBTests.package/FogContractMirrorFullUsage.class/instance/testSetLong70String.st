tests
testSetLong70String
	| future setString |
	setString := mirror method: #setString:.
	future := FogTransactionMonitorService current
		receiptFor:
			(setString
				applyOn: contract
				valueWithArguments: {('AStringOf64Characters' padRightTo: 70 with: $-)}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60).
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: ('AStringOf64Characters' padRightTo: 70 with: $-)