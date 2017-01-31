tests
testEthGetTransactionReceipt
	self
		assertEntityFromMessage: (eth messageGetTransactionReceipt: '0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionReceipt","params":["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"],"id":1}'