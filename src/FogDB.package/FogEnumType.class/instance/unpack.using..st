as yet unclassified
unpack: aString using: anETHPacker
	^ values at: (anETHPacker unpackUint8: aString) + 1