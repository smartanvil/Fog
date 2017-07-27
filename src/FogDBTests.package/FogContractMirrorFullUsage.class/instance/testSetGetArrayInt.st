tests
testSetGetArrayInt
	| future example |
	future := FogTransactionMonitorService current
		receiptFor: ((mirror method: #setSimpleArray:) applyOn: contract valueWithArguments: {{1 . 2 . 3 . 4 . 6}} sender: self ownerAccount).
	future synchronizeTimeout: 10 minutes.
	example := (mirror method: #getArray) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	self assert: example equals: {1 . 2 . 3 . 4 . 6}.
	self assert: ((mirror property: #commonArray) value: contract)equals: {1 . 2 . 3 . 4 . 6}.