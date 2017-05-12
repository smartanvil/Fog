tests
testSessionFastInstantiateAlreadyGeneratedContractGivesSessionProxy
	| instance |
	instance := session instantiate: ContractSimpleSmartContract.
	self assert: instance isKindOf: ContractSimpleSmartContract.
	self assertIsASessionProxy: instance