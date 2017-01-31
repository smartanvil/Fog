tests
testEthGetBalanceTag
	self
		assertEntityFromMessage: (eth messageGetBalance: '0x407d73d8a49eeb85d32cf465507dd71d507100c1' blockTag: 'latest')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1", "latest"],"id":1}'