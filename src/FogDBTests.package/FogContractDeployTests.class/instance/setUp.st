as yet unclassified
setUp
	super setUp.
	deployer := FogContractDeployer new 
		contract: self contract;
		owner: self ownerAccount;
		constructorArguments: {};
		yourself