packing test
testMinimalPackUint32
	self assert: (packer packUint32: self minimalDecodedUint32) equals: self minimalEncodedUint32.
