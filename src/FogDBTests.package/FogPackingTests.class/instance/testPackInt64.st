packing test
testPackInt64
	self assert: (packer packInt64: self decodedInt64) equals: self encodedInt64.
