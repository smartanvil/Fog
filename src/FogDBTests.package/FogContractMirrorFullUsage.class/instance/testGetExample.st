tests
testGetExample
	| example str enum int |
	example := (mirror method: #getExample)
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	str := (mirror method: #getString)
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	enum := (mirror method: #getEnum)
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	int := (mirror method: #getPositiveInt)
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