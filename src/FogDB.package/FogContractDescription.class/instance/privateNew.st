instance creation
privateNew
	^ FogContractInstanceBind cachedNew
		contract: self;
		yourself