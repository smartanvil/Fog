tests
testEthMining
	self
		assertEntityFromMessage: eth messageMining
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_mining","params":[],"id":1}'