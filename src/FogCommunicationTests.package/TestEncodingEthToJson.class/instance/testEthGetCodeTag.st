tests
testEthGetCodeTag
	self
		assertEntityFromMessage: (eth messageGetCode: '0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b' blockTag: 'latest')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getCode","params":["0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b", "latest"],"id":1}'