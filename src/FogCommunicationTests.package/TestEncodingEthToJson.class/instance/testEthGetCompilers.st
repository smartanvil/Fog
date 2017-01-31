tests
testEthGetCompilers
	self assertEntityFromMessage: eth messageGetCompilers equalsToJson: '{"jsonrpc":"2.0","method":"eth_getCompilers","params":[],"id":1}'