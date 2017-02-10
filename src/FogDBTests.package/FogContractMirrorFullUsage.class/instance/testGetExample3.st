tests
testGetExample3
	| example str |
	str := ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount).
	example := (mirror method: #getExample3) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	self assert: example equals: {255 . str . 2 .str . -1} asOrderedCollection