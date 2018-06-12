tests
testSetTwoString
	| future setString |
	setString := mirror method: #setTwoStrings:and:.
	future := FogTransactionMonitorService current
		receiptFor:
			(setString
				applyOn: contract
				valueWithArguments: {'Heeeey!' . 'Yeahytutuou'}
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
		equals: 'Heeeey!'