packing test
testMinimalPackUint128
	self assert: (packer packUint128: self minimalDecodedUint128) equals: self minimalEncodedUint128.
