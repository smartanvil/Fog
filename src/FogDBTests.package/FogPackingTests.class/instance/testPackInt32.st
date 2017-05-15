packing test
testPackInt32
	self assert: (packer packInt32: self decodedInt32) equals: self encodedInt32.
