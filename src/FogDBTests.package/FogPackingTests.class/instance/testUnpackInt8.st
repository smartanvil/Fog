unpackin tests
testUnpackInt8
	self assert: (packer unpackInt8: self encodedInt8) equals: self decodedInt8.
