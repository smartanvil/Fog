packing test
testMinimalPackUint8
	self assert: (packer packUint8: self minimalDecodedUint8) equals: self minimalEncodedUint8.
