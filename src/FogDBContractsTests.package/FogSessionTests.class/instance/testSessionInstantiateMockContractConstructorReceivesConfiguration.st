tests
testSessionInstantiateMockContractConstructorReceivesConfiguration
	| contract instance configuration |
	contract := session contract: FogMockContract.
	instance := contract new.
	configuration := contract mirror configuration.
	self assert: configuration isKindOf: Dictionary