tests
testSetNegativeInt
	self assert: (FogUtils new sha3_256: 'setNegativeInt(int256)') equals: (Keccak hashMessage: 'setNegativeInt(int256)')asByteArray hex