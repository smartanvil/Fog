packing test
testPackUint16
	self assert: (packer packUint16: self decodedUint16) equals: self encodedUint16.
