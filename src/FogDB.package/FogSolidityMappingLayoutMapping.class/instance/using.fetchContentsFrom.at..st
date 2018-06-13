initialization
using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash
	^ FogLazyDictionary new
		mapping: self;
		session: aSession;
		blockReference: aBlockTagNumberOrHash;
		contractAddress: aContractAddress;
		yourself