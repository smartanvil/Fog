instance creation
at: anAddress
	self error: 'shouldnt call this'.
	^ FogContractInstance new
		address: anAddress;
		contract: self;
		yourself