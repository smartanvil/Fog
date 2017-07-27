unpack
unpackInt16: aString
	| size inverse |
	size := 32767.
	inverse := 65536.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse  bitLength: 16