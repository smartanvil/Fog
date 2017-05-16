tests
testSessionInstantiateContractGivesSessionProxy
	| contract instance |
	contract := session findFileContractDescriptionByName: #simple_smart_contract.
	instance := contract new.
	self assert: instance isKindOf: contract.
	self assertIsASessionProxy: instance