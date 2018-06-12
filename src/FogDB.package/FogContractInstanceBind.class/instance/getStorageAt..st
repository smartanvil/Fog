accessing
getStorageAt: aSlotId
	^ self session fetchSlot: aSlotId onContract: self address 