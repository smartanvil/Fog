tests
testEthGetTransactionByBlockNumberAndIndex
	self assertEntityFromMessage: (eth messageGetTransactionByBlockNumber: 668 andIndex: 0) equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockNumberAndIndex","params":["0x29c","0x0"],"id":1}'