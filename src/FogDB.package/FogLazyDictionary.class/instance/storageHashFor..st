as yet unclassified
storageHashFor: aKey
	| packer |
	packer := FogBinaryPacker new.
	^ Keccak
		hashEncode: (type keyType pack: aKey using: packer) , (packer packSlotId: mapping fromSlot)