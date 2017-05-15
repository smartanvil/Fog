packing test
testPackInt128
	self assert: (packer packInt128: self decodedInt128) equals: self encodedInt128.
