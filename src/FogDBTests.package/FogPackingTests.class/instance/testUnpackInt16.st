unpackin tests
testUnpackInt16
	self assert: (packer unpackInt16: self encodedInt16) equals: self decodedInt16.
