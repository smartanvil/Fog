tests
testSetTwoString
	| future setString |
	setString := mirror method: #setTwoStrings:and:.
	future := FogTransactionMonitorService current receiptFor: (setString applyOn: contract valueWithArguments: {'Heeeey!' . 'Yeahytutuou'} sender: self ownerAccount).
	future synchronizeTimeout: 10 minutes.
	self assert: ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount) equals: 'Heeeey!'