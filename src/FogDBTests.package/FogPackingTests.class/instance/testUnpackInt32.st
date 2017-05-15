unpackin tests
testUnpackInt32
	self assert: (packer unpackInt32: self encodedInt32) equals: self decodedInt32.
