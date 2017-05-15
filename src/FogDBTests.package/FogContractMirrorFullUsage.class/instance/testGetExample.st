tests
testGetExample
	| example str enum int |
	example := (mirror method: #getExample) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	str := (mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	enum := (mirror method: #getEnum) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	int := ((mirror method: #getPositiveInt) applyOn: contract valueWithArguments: {} sender: self ownerAccount).
	self
		assert: example
		equals:
			{int.
			str.
			str.
			-1.
			enum} asOrderedCollection