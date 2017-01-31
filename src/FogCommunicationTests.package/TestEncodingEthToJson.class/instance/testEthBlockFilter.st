tests
testEthBlockFilter
	self assertEntityFromMessage: eth messageNewBlockFilter equalsToJson: '{"jsonrpc":"2.0","method":"eth_newBlockFilter","params":[],"id":1}'