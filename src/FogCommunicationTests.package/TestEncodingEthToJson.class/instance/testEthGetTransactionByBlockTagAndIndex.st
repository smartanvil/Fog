tests
testEthGetTransactionByBlockTagAndIndex
	self assertEntityFromMessage: (eth messageGetTransactionByBlockTag: 'latest' andIndex: 0) equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockNumberAndIndex","params":["latest","0x0"],"id":1}'