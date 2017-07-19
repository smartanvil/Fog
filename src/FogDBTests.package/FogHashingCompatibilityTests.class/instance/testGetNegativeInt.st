tests
testGetNegativeInt
	self assert: (FogUtils new sha3_256: 'getNegativeInt()') equals: (Keccak hashMessage: 'getNegativeInt()')asByteArray hex