access db - contract accounts
fetchSlot: aSlotId onContract: aContractAddress atBlock: aBlockHashOrNumber
	^ connection eth getStorageAt: aContractAddress upTo: aSlotId blockNumber: aBlockHashOrNumber