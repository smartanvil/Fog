tests
testGetExample3
	| example str enum int |
	str := (mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	example := (mirror method: #getExample3) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	enum := (mirror method: #getEnum) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
		int := ((mirror method: #getPositiveInt) applyOn: contract valueWithArguments: {} sender: self ownerAccount).
	self
		assert: example
		equals:
			{int.
			str.
			enum.
			str.
			-1} asOrderedCollection