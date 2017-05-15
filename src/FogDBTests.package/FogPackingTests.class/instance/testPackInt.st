packing test
testPackInt
	self assert: (packer packInt: self decodedInt) equals: self encodedInt.
