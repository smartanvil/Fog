tests
testEthCompileLLL
	self
		assertEntityFromMessage: (eth messageCompileLLL: '(returnlll (suicide (caller)))')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_compileLLL","params":["(returnlll (suicide (caller)))"],"id":1}'