tests
testEthSyncing
	self assertEntityFromMessage: eth messageSyncing equalsToJson: '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":1}'
