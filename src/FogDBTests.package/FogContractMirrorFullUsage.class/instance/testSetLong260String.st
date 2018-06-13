tests
testSetLong260String
	| future setString |
	setString := mirror method: #setString:.
	future := FogTransactionMonitorService current
		receiptFor:
			(setString
				using: session
				applyOn: contract
				valueWithArguments: {('AStringOf256Characters' padRightTo: 260 with: $#)}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60).
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: ('AStringOf256Characters' padRightTo: 260 with: $#)