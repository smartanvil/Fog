unpackin tests
testUnpackUint
	self assert: (packer unpackUint: self encodedUint) equals: self decodedUint.
