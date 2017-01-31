tests
testEthGetBlockTransactionCountByNumber
	self
		assertEntityFromMessage: (eth messageGetBlockTransactionCountByNumber: 232)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getBlockTransactionCountByNumber","params":["0xe8"],"id":1}'