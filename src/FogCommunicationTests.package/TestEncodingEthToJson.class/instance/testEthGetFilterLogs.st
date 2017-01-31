tests
testEthGetFilterLogs
	self
		assertEntityFromMessage: (eth messageGetFilterLogs: 11)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getFilterLogs","params":[ "0xb"],"id":1}'