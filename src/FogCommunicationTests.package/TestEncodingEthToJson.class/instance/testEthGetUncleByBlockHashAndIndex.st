tests
testEthGetUncleByBlockHashAndIndex
	self
		assertEntityFromMessage: (eth messageGetUncleByBlockHash: '0xc6ef2fc5426d6ad6fd9e2a26abeab0aa2411b7ab17f30a99d3cb96aed1d1055b' andIndex: 0)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getUncleByBlockHashAndIndex","params":["0xc6ef2fc5426d6ad6fd9e2a26abeab0aa2411b7ab17f30a99d3cb96aed1d1055b", "0x0"],"id":1}'