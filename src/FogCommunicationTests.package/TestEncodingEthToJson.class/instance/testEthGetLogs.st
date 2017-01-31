tests
testEthGetLogs
	| filterDefinition |
	filterDefinition := FogFilterDefinition new
		topics: (FogFilterTopic subject: '0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b');
		yourself.
	self
		assertEntityFromMessage: (eth messageGetLogs: filterDefinition)
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_getLogs","params":[ { "topics": ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b"]}],"id":1}'