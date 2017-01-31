tests
testEthGetBlockByHash
	self
		assertEntityFromMessage: (eth messageGetBlockByHash: '0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331' full: true)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getBlockByHash","params":["0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331", true],"id":1}'