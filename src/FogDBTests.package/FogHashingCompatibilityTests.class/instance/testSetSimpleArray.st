tests
testSetSimpleArray
	self assert: (FogUtils new sha3_256: 'setSimpleArray(int256[])') equals: (Keccak hashMessage: 'setSimpleArray(int256[])')asByteArray hex