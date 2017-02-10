unpack
unpackInt64: aString
	| size inverse |
	size := 9223372036854775807.
	inverse := 18446744073709551616.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse