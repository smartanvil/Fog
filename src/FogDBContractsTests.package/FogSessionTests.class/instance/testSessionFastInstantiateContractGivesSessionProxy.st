tests
testSessionFastInstantiateContractGivesSessionProxy
	| instance contract |
	contract := session contract: #simple_smart_contract.
	instance := session instantiate: #simple_smart_contract.
	self assert: instance isKindOf: contract.
	self assertIsASessionProxy: instance