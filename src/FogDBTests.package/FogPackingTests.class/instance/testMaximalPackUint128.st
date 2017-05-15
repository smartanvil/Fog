packing test
testMaximalPackUint128
	self assert: (packer packUint128: self maximalDecodedUint128) equals: self maximalEncodedUint128
