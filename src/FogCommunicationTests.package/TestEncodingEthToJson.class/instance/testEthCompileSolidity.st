tests
testEthCompileSolidity
	self
		assertEntityFromMessage: (eth messageCompileSolidity: 'contract test { function multiply(uint a) returns(uint d) {   return a * 7;   } }')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_compileSolidity","params":["contract test { function multiply(uint a) returns(uint d) {   return a * 7;   } }"],"id":1}'