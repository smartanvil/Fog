tests
testEthGetStorageAtBlockTag
	self
		assertEntityFromMessage: (eth messageGetStorageAt: '0x295a70b2de5e3953354a6a8344e616ed314d7251' upTo: 0 blockTag: 'earliest')
		equalsToJson: '{"jsonrpc":"2.0", "method": "eth_getStorageAt", "params": ["0x295a70b2de5e3953354a6a8344e616ed314d7251", "0x0", "earliest"], "id": 1}'