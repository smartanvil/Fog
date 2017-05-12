tests
testSessionFetchContractAlreadyGenerated
	| contract |
	contract := session contract: ContractSimpleSmartContract .
	self assertIsASessionProxy: contract.
	self assert: contract superclass = FogContractProxy