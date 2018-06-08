marshaling
pack: aValue using: aFogPacker
	^ aFogPacker packUint8: (values indexOf: aValue) - 1