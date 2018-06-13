initialization
using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash
	^ mappings collect: [ :m | m using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash]