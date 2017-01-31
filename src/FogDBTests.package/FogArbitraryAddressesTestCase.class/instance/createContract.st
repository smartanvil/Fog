as yet unclassified
createContract
	^ testingContract
		ifNil: [ testingContract := FogContractDeployer new
				contract: self createContractDescription;
				owner: self ownerAccount;
				constructorArguments: {};
				createAndDeployInstance.
			testingContract
				waitIsReady;
				yourself ]