tests
testEthNewPendingTransactionFilter
	self
		assertEntityFromMessage: eth messageNewPendingTransactionFilter
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_newPendingTransactionFilter","params":[],"id":1}'