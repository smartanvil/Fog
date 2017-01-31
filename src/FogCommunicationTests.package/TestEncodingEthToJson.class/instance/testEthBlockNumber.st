tests
testEthBlockNumber
	self assertEntityFromMessage: eth messageBlockNumber equalsToJson: '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}'
