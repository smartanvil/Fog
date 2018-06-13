initialization
using: aSession fetchContentsFrom: anETHContractInstanceBind at: aBlockTagNumberOrHash
	^ mappings collect: [ :m | m using: aSession fetchContentsFrom: anETHContractInstanceBind at: aBlockTagNumberOrHash]