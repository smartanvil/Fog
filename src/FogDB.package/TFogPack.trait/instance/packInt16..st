pack
packInt16: aString
	| size inverse |
	size := 32767.
	inverse := 65536.
	^ self packUint16: (self uintFor: aString maxPositive: size maxNumber: inverse)