unpackin tests
testUnpackInt
	self assert: (packer unpackInt: self encodedInt) equals: self decodedInt.
