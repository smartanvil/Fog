unpackin tests
testUnpackUint64
	self assert: (packer unpackUint64: self encodedUint64) equals: self decodedUint64.
