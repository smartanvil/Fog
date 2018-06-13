as yet unclassified
using: aSession fetchContentsFrom: anETHContractInstanceBind at: aBlockTagNumberOrHash
	self assert: fromSlot = toSlot.
	^ self extractFromSlot: (aSession fetchSlot: fromSlot onContract: anETHContractInstanceBind address at: aBlockTagNumberOrHash)