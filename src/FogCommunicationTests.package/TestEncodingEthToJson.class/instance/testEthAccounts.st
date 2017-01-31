tests
testEthAccounts
	self assertEntityFromMessage: eth messageAccounts equalsToJson: '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}'
