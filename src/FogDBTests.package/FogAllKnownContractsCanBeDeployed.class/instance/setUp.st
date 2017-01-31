initialization
setUp
	super setUp.
	self timeLimit: 3 minutes.
	deployers := FogContractDescription instances
		select: #hasAst
		thenCollect: [ :contract | 
			FogContractDeployer new
				contract: contract;
				owner: self ownerAccount;
				constructorArguments: {};
				yourself ]