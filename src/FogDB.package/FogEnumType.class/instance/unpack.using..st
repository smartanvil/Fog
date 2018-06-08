marshaling
unpack: aString using: anETHPacker
	^ values at: (anETHPacker unpackUint8: aString) + 1