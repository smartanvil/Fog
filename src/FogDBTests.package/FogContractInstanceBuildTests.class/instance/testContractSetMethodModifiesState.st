tests
testContractSetMethodModifiesState
	self
		assert:
			(simpleStorage contract mirror methods
				detect: [ :m | m selector asSymbol = #set: ]) isStateModifier