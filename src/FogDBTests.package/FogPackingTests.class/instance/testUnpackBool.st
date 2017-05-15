unpackin tests
testUnpackBool
	self assert: (packer unpackBool: self encodedBool) equals: self decodedBool.
