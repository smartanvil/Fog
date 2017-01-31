tests
testEthGetWork
	self assertEntityFromMessage: eth messageGetWork equalsToJson: '{"jsonrpc":"2.0","method":"eth_getWork","params":[],"id":1}'