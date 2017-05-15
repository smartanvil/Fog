unpackin tests
testUnpackInt256
	self assert: (packer unpackInt256: self encodedInt256) equals: self decodedInt256.
