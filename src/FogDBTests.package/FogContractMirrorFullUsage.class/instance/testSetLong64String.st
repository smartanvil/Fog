tests
testSetLong64String
	| future setString |
	setString := mirror method: #setString:.
	future := session 
		receiptFor:
			(setString
				using: session
				applyOn: contract
				valueWithArguments: {('AStringOf64Characters' padRightTo: 64 with: $-)}
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
		equals: ('AStringOf64Characters' padRightTo: 64 with: $-)