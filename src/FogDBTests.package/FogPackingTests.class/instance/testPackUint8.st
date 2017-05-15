packing test
testPackUint8
	self assert: (packer packUint8: self decodedUint8) equals: self encodedUint8.
