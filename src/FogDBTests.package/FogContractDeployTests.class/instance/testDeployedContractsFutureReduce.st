tests
testDeployedContractsFutureReduce
	| instance  |
	instance := deployer createAndDeployInstance.
	self assert: instance isKindOf: FogContractInstanceBind.
	self assert: instance isReady not.
	instance waitIsReady.
	self assert: instance isReady