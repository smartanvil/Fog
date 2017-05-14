tests
testGetExample2
	| example str enum |
	str := (mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	example := (mirror method: #getExample2) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	enum := (mirror method: #getEnum) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	self
		assert: example
		equals:
			{str.
			255.
			-1.
			enum.
			str} asOrderedCollection