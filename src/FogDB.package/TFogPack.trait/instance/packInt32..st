pack
packInt32: aString
	| size inverse |
	size := 2147483647.
	inverse := 4294967296.
	^ self packUint32:(self uintFor: aString maxPositive: size maxNumber: inverse)