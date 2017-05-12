tests
testSessionFetchContract
	| contract |
	contract := session contract: #simple_smart_contract.
	self assertIsASessionProxy: contract.
	self assert: contract superclass = FogContractProxy