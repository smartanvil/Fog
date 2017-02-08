tests
testContractSetMethodModifiesState
	self
		assert:
			(simpleStorage contract mirror instanceMirror methods
				detect: [ :m | m selector asSymbol = #set: ]) isStateModifier