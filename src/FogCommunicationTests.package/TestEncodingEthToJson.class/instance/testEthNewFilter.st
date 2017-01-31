tests
testEthNewFilter
	| filterDefinition |
	filterDefinition := FogFilterDefinition new
		from: 1;
		to: 2;
		address: '0x8888f1f195afa192cfee860698584c030f4c9db1';
		topics:
			(((FogFilterTopic subject: '0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b') and: FogFilterTopic any)
				and:
					(FogFilterTopic
						subject: '0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b'
						or: '0x000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc')).
	self
		assertEntityFromMessage: (eth messageNewFilter: filterDefinition)
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_newFilter","params":[{ "fromBlock": "0x1", "toBlock": "0x2", "address": "0x8888f1f195afa192cfee860698584c030f4c9db1", "topics": ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", null, ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", "0x000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc"]]}],"id":1}'