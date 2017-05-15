unpackin tests
testUnpackInt128
	self assert: (packer unpackInt128: self encodedInt128) equals: self decodedInt128.
