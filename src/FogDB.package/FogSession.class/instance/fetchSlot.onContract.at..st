access db - contract accounts
fetchSlot: aSlotId onContract: aContractAddress at: aBlockTagOrNumberOrHash
	^ connection eth getStorageAt: aContractAddress upTo: aSlotId block: aBlockTagOrNumberOrHash