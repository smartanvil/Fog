tests
testGetNegativeInt
	self assert: '53340aba8ee7e5776918d534102fe7dd00e3ec64480fca0c7ab502e314573613' equals: (Keccak hashMessage: 'getNegativeInt()')asByteArray hex