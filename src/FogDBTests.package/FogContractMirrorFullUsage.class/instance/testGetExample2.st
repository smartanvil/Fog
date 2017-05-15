tests
testGetExample2
	| example str enum int |
	str := (mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	example := (mirror method: #getExample2) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	enum := (mirror method: #getEnum) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
		int := ((mirror method: #getPositiveInt) applyOn: contract valueWithArguments: {} sender: self ownerAccount).
	self
		assert: example
		equals:
			{str.
			int.
			-1.
			enum.
			str} asOrderedCollection