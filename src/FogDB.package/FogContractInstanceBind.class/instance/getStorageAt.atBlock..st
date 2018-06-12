accessing
getStorageAt: aSlotId atBlock: aBlockHashOrNumber
	^ self session fetchSlot: aSlotId onContract: self address atBlock: aBlockHashOrNumber