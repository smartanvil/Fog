tests
testSessionMockInstantanceMethodActivationReceivesConfiguration
	| contract instance configuration |
	contract := session contract: FogMockContract.
	instance := contract new.
	configuration := contract mirror instanceMirror configuration.
	self assert: configuration isKindOf: Dictionary