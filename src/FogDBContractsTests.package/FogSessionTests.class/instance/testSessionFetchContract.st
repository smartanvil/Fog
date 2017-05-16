tests
testSessionFetchContract
	| contract |
	contract := (session connection findFileContractDescriptionByName: #simple_smart_contract) contract.
	self assertIsASessionProxy: contract.
	self assert: contract name equals: #ContractSimpleSmartContract