as yet unclassified
testWeb3HashDataEncoded
	self
		assertEntityFromMessage: (web3 messageSha3: '0x68656c6c6f20776f726c64')
		equalsToJson: '{"jsonrpc":"2.0","method":"web3_sha3","params":["0x68656c6c6f20776f726c64"],"id":1}'