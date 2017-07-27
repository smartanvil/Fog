pack
packInt8: aString
	| size inverse |
	size := 127.
	inverse := 256.
	^ self packUint8: (self uintFor: aString maxPositive: size maxNumber: inverse)