tests
testContractSetMethodSignature
	self
		assert:
			(simpleStorage contract mirror methods
				allSatisfy: [ :method | 
					('0x' , ((connection web3 sha3_256: method name) copyFrom: 1 to: 8))
						= method signature ])