as yet unclassified
unpackStream: aReadStream using: aFogPacker 
	^ self unpack: (aReadStream next: self staticSlotSize ) using: aFogPacker 