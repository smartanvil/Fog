packing test
testMinimalPackInt128
	self assert: (packer packInt128: self minimalDecodedInt128) equals: self minimalEncodedInt128.
