tests
testGetExample
	| example str enum |
	example := (mirror method: #getExample) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	str := (mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	enum := (mirror method: #getEnum) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	self
		assert: example
		equals:
			{255.
			str.
			str.
			-1.
			enum} asOrderedCollection