tests
testEthHashrate
	self assertEntityFromMessage: eth messageHashrate equalsToJson: '{"jsonrpc":"2.0","method":"eth_hashrate","params":[],"id":1}'
