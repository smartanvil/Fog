packing test
testPackUint32
	self assert: (packer packUint32: self decodedUint32) equals: self encodedUint32.
