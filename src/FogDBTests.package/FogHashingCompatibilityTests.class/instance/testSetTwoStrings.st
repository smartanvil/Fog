tests
testSetTwoStrings
	self assert: '82e361b7e81d96e351fe1fe328a5dc7c13e9a83a9b160ba41c0e4958a98f1611' equals: (Keccak hashMessage: 'setTwoStrings(string,string)')asByteArray hex