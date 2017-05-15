packing test
testPackUint
	self assert: (packer packUint: self decodedUint) equals: self encodedUint.
