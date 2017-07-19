tests
testGetString
	self assert: (FogUtils new sha3_256: 'getString()') equals: (Keccak hashMessage: 'getString()')asByteArray hex