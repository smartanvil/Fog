tests
testSessionFastInstantiateContractGivesSessionProxy
	| instance contract |
	contract := session connection findFileContractDescriptionByName: #simple_smart_contract.
	instance := session instantiate: #simple_smart_contract.
	self assert: instance isKindOf: contract.
	self assertIsASessionProxy: instance