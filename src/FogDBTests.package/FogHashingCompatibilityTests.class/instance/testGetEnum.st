tests
testGetEnum
	self assert: (FogUtils new sha3_256: 'getEnum()') equals: (Keccak hashMessage: 'getEnum()')asByteArray hex