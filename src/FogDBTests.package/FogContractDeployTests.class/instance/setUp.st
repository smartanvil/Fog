initialization
setUp
	super setUp.
	self timeLimit: 3 minutes.
	deployer := FogContractDeployer new 
		contract: self contract;
		owner: self ownerAccount;
		constructorArguments: {};
		yourself