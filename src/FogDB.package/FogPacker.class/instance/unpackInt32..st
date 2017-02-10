unpack
unpackInt32: aString
	| size inverse |
	size := 2147483647.
	inverse := 4294967296.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse