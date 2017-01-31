tests
testEthGasPrice
	self assertEntityFromMessage: eth messageGasPrice equalsToJson: '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":1}'
