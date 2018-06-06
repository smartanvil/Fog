tests
testGetPositiveInt
	self assert: 'f25c229d8ad21778e3784c73de8178aa61f1d68c2e0a73872519ed3e7690741d' equals: (Keccak hashMessage: 'getPositiveInt()')asByteArray hex