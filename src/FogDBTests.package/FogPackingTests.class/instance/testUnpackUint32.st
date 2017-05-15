unpackin tests
testUnpackUint32
	self assert: (packer unpackUint32: self encodedUint32) equals: self decodedUint32.
