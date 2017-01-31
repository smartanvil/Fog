tests
testEthGetUncleByBlockNumberAndIndex
	self assertEntityFromMessage: (eth messageGetUncleByBlockNumber: 668 andIndex: 0) equalsToJson: '{"jsonrpc":"2.0","method":"eth_getUncleByBlockNumberAndIndex","params":["0x29c", "0x0"],"id":1}'