tests
testSetPositiveInt
	self assert: '7b65ec8af9d7a4e6073677a3dd0bc83a52bcb7f65478ce343738db427b06108b' equals: (Keccak hashMessage: 'setPositiveInt(int256)')asByteArray hex