tests
testGetExample
	| example str enum int |
	example := (mirror method: #getExample)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	str := (mirror method: #getString)
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
			{int.
			str.
			str.
			-1.
			enum} asOrderedCollection