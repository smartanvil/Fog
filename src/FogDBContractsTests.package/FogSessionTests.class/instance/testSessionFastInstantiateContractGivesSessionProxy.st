tests
testSessionFastInstantiateContractGivesSessionProxy
	| instance contract |
	contract := (session connection findFileContractDescriptionByName: #simple_smart_contract) contract.
	instance := contract constructor.
	self assert: instance isKindOf: contract.
	self assertIsASessionProxy: instance