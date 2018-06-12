tests
testGetExample3
	| example str enum int |
	str := (mirror method: #getString)
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	example := (mirror method: #getExample3)
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
			enum.
			str.
			-1} asOrderedCollection