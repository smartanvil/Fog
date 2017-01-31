as yet unclassified
testWeb3VersionEncoded
	self assertEntityFromMessage: web3 messageClientVersion equalsToJson: '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}'