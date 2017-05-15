packing test
testPackUint128
	self assert: (packer packUint128: self decodedUint128) equals: self encodedUint128.
