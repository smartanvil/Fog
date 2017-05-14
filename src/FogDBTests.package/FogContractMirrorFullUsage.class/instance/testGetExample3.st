tests
testGetExample3
	| example str enum |
	str := (mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	example := (mirror method: #getExample3) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	enum := (mirror method: #getEnum) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	self
		assert: example
		equals:
			{255.
			str.
			enum.
			str.
			-1} asOrderedCollection