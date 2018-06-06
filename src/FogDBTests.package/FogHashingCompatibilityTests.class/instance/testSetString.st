tests
testSetString
	self assert: '7fcaf6661d59d1261d7d74068830b2e2b73988cdc7c14af3ab82282bb62a9288' equals: (Keccak hashMessage: 'setString(string)')asByteArray hex