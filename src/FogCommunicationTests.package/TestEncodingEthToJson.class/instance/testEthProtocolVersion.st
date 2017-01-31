tests
testEthProtocolVersion
	self assertEntityFromMessage: eth messageProtocolVersion equalsToJson: '{"jsonrpc":"2.0","method":"eth_protocolVersion","params":[],"id":1}'