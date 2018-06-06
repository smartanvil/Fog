tests
testGetString
	self assert: '89ea642f517dcb35f0d700efe29d741904d47d1a0aa4e441db479fc1e9f95fae' equals: (Keccak hashMessage: 'getString()')asByteArray hex