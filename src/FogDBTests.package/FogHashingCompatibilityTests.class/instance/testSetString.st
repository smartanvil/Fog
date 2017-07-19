tests
testSetString
	self assert: (FogUtils new sha3_256: 'setString(string)') equals: (Keccak hashMessage: 'setString(string)')asByteArray hex