tests
testSessionInstantiateMockContract
	| contract |
	contract := session contract: FogMockContract.
	self assert: contract isKindOf: FogMockContract.
	self assertIsASessionProxy: contract
	