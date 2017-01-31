tests
testEthCoinBase
	self assertEntityFromMessage: eth messageCoinBase equalsToJson: '{"jsonrpc":"2.0","method":"eth_coinbase","params":[],"id":1}'
