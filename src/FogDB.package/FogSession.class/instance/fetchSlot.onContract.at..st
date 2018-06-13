access db - contract accounts
fetchSlot: aSlotId onContract: aContractAddress at: aBlockTagOrNumberOrHash
	^ connection eth getStorageAt: aContractAddress address upTo: aSlotId block: aBlockTagOrNumberOrHash