tests
testSetTwoStringsEnumInt
	self assert: (FogUtils new sha3_256: 'setTwoStringsEnumInt(string,uint8,int256,string)') equals: (Keccak hashMessage: 'setTwoStringsEnumInt(string,uint8,int256,string)')asByteArray hex