tests
testSetTwoStrings
	self assert: (FogUtils new sha3_256: 'setTwoStrings(string,string)') equals: (Keccak hashMessage: 'setTwoStrings(string,string)')asByteArray hex