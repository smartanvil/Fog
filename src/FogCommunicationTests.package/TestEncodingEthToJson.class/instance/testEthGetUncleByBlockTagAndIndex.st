tests
testEthGetUncleByBlockTagAndIndex
	self assertEntityFromMessage: (eth messageGetUncleByBlockTag: 'latest' andIndex: 0) equalsToJson: '{"jsonrpc":"2.0","method":"eth_getUncleByBlockNumberAndIndex","params":["latest", "0x0"],"id":1}'