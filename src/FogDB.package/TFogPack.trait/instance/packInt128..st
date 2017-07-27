pack
packInt128: aString
	| size inverse |
	size := 170141183460469231731687303715884105727.
	inverse := 340282366920938463463374607431768211456.
	^ self packUint128: (self uintFor: aString maxPositive: size maxNumber: inverse). 
