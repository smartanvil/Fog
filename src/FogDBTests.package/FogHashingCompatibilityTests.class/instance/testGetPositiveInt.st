tests
testGetPositiveInt
	self assert: (FogUtils new sha3_256: 'getPositiveInt()') equals: (Keccak hashMessage: 'getPositiveInt()')asByteArray hex