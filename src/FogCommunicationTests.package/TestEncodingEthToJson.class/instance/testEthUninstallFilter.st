tests
testEthUninstallFilter
	self
		assertEntityFromMessage: (eth messageUninstallFilterID: 11)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_uninstallFilter","params":[ "0xb"],"id":1}'