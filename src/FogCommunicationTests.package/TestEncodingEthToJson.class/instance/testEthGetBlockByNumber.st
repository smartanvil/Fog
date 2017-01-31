tests
testEthGetBlockByNumber
	self
		assertEntityFromMessage: (eth messageGetBlockByNumber: 436 full: true)
		equalsToJson:'{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x1b4", true],"id":1}'
