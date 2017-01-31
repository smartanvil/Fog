instance creation
at: anAddress
	^ FogContractInstanceBind cachedNew
		address: anAddress;
		contract: self;
		yourself