tests
testGetExample
	| example str |
	example := (mirror method: #getExample) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	str := ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount).
	self assert: example equals: { 255 . str . str . -1 . 2 } asOrderedCollection.
