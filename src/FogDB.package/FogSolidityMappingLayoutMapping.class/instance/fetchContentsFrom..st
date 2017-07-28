initialization
fetchContentsFrom: anETHContractInstanceBind
	^ FogLazyDictionary new
		mapping: self;
		bind: anETHContractInstanceBind;
		yourself