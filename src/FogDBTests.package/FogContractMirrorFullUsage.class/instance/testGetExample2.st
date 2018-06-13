tests
testGetExample2
	| example str enum int |
	str := (mirror method: #getString)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	example := (mirror method: #getExample2)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	enum := (mirror method: #getEnum)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	int := (mirror method: #getPositiveInt)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	self
		assert: example
		equals:
			{str.
			int.
			-1.
			enum.
			str} asOrderedCollection