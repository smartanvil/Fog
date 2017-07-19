tests
testSetPositiveInt
	self assert: (FogUtils new sha3_256: 'setPositiveInt(int256)') equals: (Keccak hashMessage: 'setPositiveInt(int256)')asByteArray hex