tests
testSetTwoStringsEnumInt
	self assert: 'f3373137049661e08d0d23df06d30badfb531791427d872836cd3696a9316828' equals: (Keccak hashMessage: 'setTwoStringsEnumInt(string,uint8,int256,string)')asByteArray hex