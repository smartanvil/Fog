unpackin tests
testUnpackInt64
	self assert: (packer unpackInt64: self encodedInt64) equals: self decodedInt64.
