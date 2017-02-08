tests
testSetString
	| future setString |
	setString := mirror method: #setString:.
	future := FogTransactionMonitorService current receiptFor: (setString applyOn: contract valueWithArguments: {'Hola'} sender: self ownerAccount).
	future synchronizeTimeout: 10 minutes.
	self assert: ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount) equals: 'Hola'