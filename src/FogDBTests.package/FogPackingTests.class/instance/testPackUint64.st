packing test
testPackUint64
	self assert: (packer packUint64: self decodedUint64) equals: self encodedUint64.
