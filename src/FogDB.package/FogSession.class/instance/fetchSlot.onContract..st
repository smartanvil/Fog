access db - contract accounts
fetchSlot: aSlotId onContract: aContractAddress
	^ connection eth getStorageAt: aContractAddress upTo: aSlotId blockTag: #latest