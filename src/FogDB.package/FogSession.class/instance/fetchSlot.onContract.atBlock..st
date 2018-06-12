access db - contract accounts
fetchSlot: aSlotId onContract: aContractAddress atBlock: aBlockHashOrNumber
	^ self connection eth getStorageAt: aContractAddress upTo: aSlotId blockNumber: aBlockHashOrNumber