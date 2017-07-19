as yet unclassified
testGetExample
	self assert: (FogUtils new sha3_256: 'getExample()') equals: (Keccak hashMessage: 'getExample()') asByteArray hex