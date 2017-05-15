packing test
testMinimalPackUint16
	self assert: (packer packUint16: self minimalDecodedUint16) equals: self minimalEncodedUint16.
