creation
createContractInstanceFor: aFogFileContractDescription at: aContractAddress
	^ FogContractInstance new
		address: aContractAddress;
		contract: aFogFileContractDescription;
		session: self;
		yourself