tests
testAllDeployerDeploy
	| instances detectedContracts |
	instances := deployers collect: #createAndDeployInstance.
	instances do: [ :i | i waitIsReady  ].
	self assert: (instances allSatisfy: #isReady).
	detectedContracts := instances collect: [ : i | (FogConnection currentConnection eth getCode: i address   blockTag: 'latest') contract ].
	self assert: detectedContracts equals: (deployers collect: #contract). 
	