packing test
testPackInt256
	self assert: (packer packInt256: self decodedInt256) equals: self encodedInt256.
