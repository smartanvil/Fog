unifing
getStorageAt: aContractAddress upTo: aSlotId block: aBlockTagOrNumberOrHash
	^ (#(latest earliest pending) includes: aBlockTagOrNumberOrHash)
		ifTrue: [ self getStorageAt: aContractAddress upTo: aSlotId blockTag: aBlockTagOrNumberOrHash ]
		ifFalse: [ self getStorageAt: aContractAddress upTo: aSlotId blockNumber: aBlockTagOrNumberOrHash ]