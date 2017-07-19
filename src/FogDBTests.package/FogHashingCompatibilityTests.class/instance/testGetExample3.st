tests
testGetExample3
	self assert: (FogUtils new sha3_256: 'getExample3()') equals: (Keccak hashMessage: 'getExample3()')asByteArray hex