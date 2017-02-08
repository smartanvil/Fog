tests
testContractHasSetMethod
	self
		assert:
			(simpleStorage contract mirror instanceMirror methods
				select: [ :m | m selector asSymbol = #set: ]) size
		equals: 1