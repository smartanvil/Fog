packing test
testMinimalPackUint64
	self assert: (packer packUint64: self minimalDecodedUint64) equals: self minimalEncodedUint64.
