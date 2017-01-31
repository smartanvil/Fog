as yet unclassified
deployFor: anAccount
	^ FogContractDeployer new
		contract: self;
		owner: anAccount;
		constructorArguments: {};
		createAndDeployInstance