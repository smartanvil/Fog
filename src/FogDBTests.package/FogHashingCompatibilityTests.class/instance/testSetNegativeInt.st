tests
testSetNegativeInt
	self assert: 'b3edd0eb351a56cf64c8c76e00cf5cc92b1bc8770a5aee308c30699fe1caff5a' equals: (Keccak hashMessage: 'setNegativeInt(int256)')asByteArray hex