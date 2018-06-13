as yet unclassified
using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash
	self assert: fromSlot = toSlot.
	^ self
		extractFromSlot:
			(aSession
				fetchSlot: fromSlot
				onContract: aContractAddress
				at: aBlockTagNumberOrHash)