tests
testEthGetTransactionCountBlockNumber
	self
		assertEntityFromMessage: (eth messageGetTransactionCount: '0x407d73d8a49eeb85d32cf465507dd71d507100c1' blockNumber: 1)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionCount","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1","0x1"],"id":1}'