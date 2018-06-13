tests
testSetTwoString
	| future setString |
	setString := mirror method: #setTwoStrings:and:.
	future := FogTransactionMonitorService current
		receiptFor:
			(setString
				using: session
				applyOn: contract
				valueWithArguments: {'Heeeey!' . 'Yeahytutuou'}
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
		equals: 'Heeeey!'