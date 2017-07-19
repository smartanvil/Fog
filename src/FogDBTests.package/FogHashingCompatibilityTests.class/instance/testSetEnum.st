tests
testSetEnum
	self assert: (FogUtils new sha3_256: 'setEnum(uint8)') equals: (Keccak hashMessage: 'setEnum(uint8)')asByteArray hex