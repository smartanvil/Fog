instance creation
at: anAddress
	^ FogContractInstanceBind new
		address: anAddress;
		contract: self;
		yourself