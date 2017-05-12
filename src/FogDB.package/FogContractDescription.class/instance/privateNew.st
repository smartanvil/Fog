instance creation
privateNew
	self halt: 'This should arrive to a session'.
	^ FogContractInstanceBind new
		contract: self;
		yourself