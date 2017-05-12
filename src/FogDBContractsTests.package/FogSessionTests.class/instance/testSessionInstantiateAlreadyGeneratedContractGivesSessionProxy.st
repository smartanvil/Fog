tests
testSessionInstantiateAlreadyGeneratedContractGivesSessionProxy
	| contract instance |
	contract := session contract: ContractSimpleSmartContract.
	instance := contract new.
	self assert: instance isKindOf: contract.
	self assertIsASessionProxy: instance