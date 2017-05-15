packing test
testMinimalPackUint
	self assert: (packer packUint: self minimalDecodedUint) equals: self minimalEncodedUint.
