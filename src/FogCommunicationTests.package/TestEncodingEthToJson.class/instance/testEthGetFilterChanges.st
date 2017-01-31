tests
testEthGetFilterChanges
	self
		assertEntityFromMessage: (eth messageGetFilterChanges: 11)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getFilterChanges","params":[ "0xb"],"id":1}'