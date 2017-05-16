tests
testSessionFetchContract
	| contract |
	contract := session connection findFileContractDescriptionByName:  #simple_smart_contract.
	self assertIsASessionProxy: contract.
	self assert: contract superclass = FogContractProxy