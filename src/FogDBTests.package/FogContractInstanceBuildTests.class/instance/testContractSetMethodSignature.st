tests
testContractSetMethodSignature
	self
		assert:
			(simpleStorage contract mirror instanceMirror methods
				allSatisfy: [ :method | 
					('0x' , ((connection web3 sha3_256: method signatureName) copyFrom: 1 to: 8))
						= method signature ])