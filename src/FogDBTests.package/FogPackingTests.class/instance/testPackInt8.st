packing test
testPackInt8
	self assert: (packer packInt8: self decodedInt8) equals: self encodedInt8.
