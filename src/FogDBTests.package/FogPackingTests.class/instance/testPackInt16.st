packing test
testPackInt16
	self assert: (packer packInt16: self decodedInt16) equals: self encodedInt16.
