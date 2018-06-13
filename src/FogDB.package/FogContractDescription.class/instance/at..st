instance creation
at: anAddress
	^ FogContractInstance new
		address: anAddress;
		contract: self;
		yourself