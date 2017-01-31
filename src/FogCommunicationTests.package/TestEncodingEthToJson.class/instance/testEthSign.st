tests
testEthSign
	self
		assertEntityFromMessage:
			(eth
				messageSignWith: '0x8a3106a3e50576d4b6794a0e74d3bb5f8c9acaab'
				sha3Data: '0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470')
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_sign","params":["0x8a3106a3e50576d4b6794a0e74d3bb5f8c9acaab", "0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470"],"id":1}'