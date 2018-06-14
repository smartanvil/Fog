tests
testSetLong130String
	| future setString |
	setString := mirror method: #setString:.
	future := session 
		receiptFor:
			(setString
				using: session
				applyOn: contract
				valueWithArguments: {('AStringOf128Characters' padRightTo: 130 with: $#)}
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
		equals: ('AStringOf128Characters' padRightTo: 130 with: $#)