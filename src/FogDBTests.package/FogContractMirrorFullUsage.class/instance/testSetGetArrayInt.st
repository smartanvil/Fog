tests
testSetGetArrayInt
	| future example |
	future := FogTransactionMonitorService current
		receiptFor:
			((mirror method: #setSimpleArray:)
				using: session
				applyOn: contract
				valueWithArguments: {{1 . 2 . 3 . 4 . 6}}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60).
	future synchronizeTimeout: 10 minutes.
	example := (mirror method: #getArray)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	self assert: example equals: {1 . 2 . 3 . 4 . 6}.
	self assert: ((mirror property: #commonArray) value: contract) equals: {1 . 2 . 3 . 4 . 6}