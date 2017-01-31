initialization
fetchContentsFrom: anETHContractInstanceBind
	self assert: fromSlot = toSlot.
	^ self extractFromSlot: (anETHContractInstanceBind getStorageAt: fromSlot)