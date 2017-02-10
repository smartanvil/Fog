unpack
unpackInt8: aString
	| size inverse |
	size := 127.
	inverse := 256.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse