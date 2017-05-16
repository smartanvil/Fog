tests
testSessionFetchContractDescription
	| contract |
	contract := session connection findFileContractDescriptionByName: #simple_smart_contract.
	self assertIsASessionProxy: contract.
	self assert: contract class name equals: #FogFileContractDescription