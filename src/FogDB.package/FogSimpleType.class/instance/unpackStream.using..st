marshaling
unpackStream: aReadStream using: aFogPacker  
	^ self unpack: (aReadStream next: self staticSlotSize *2  ) using: aFogPacker 