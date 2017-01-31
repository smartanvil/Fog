tests
testEthCompileSerpent
	self
		assertEntityFromMessage: (eth messageCompileSerpent: '/* serpent */ ')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_compileSerpent","params":["/* serpent */ "],"id":1}'