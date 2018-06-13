initialization
using: aSession fetchContentsFrom: anETHContractInstanceBind at: aBlockTagNumberOrHash
	^ FogLazyDictionary new
		mapping: self;
		session: aSession;
		blockReference: aBlockTagNumberOrHash;
		bind: anETHContractInstanceBind;
		yourself