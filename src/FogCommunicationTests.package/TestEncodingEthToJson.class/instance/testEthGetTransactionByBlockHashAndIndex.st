tests
testEthGetTransactionByBlockHashAndIndex
	self
		assertEntityFromMessage: (eth messageGetTransactionByBlockHash: '0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331' andIndex: 0)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockHashAndIndex","params":["0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331","0x0"],"id":1}'