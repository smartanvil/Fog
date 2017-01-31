initialization
fetchContentsFrom: anETHContractInstanceBind
	^ mappings collect: [ :m | m fetchContentsFrom: anETHContractInstanceBind ]