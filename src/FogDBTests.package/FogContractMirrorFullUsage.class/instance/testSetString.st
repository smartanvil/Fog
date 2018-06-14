tests
testSetString
	| future setString |
	setString := mirror method: #setString:.
	future := session monitor
		receiptFor:
			(setString
				using: session
				applyOn: contract
				valueWithArguments: {'Hithere'}
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
		equals: 'Hithere'