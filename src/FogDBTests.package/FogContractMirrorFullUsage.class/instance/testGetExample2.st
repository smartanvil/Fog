tests
testGetExample2
	| example str |
	str := ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount).
	example := (mirror method: #getExample2)
		applyOn: contract
		valueWithArguments: {}
		sender: self ownerAccount.
	self assert: example equals: {str . 255 . -1 . 2 . str} asOrderedCollection