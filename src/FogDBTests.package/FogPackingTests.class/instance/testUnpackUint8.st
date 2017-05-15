unpackin tests
testUnpackUint8
	self assert: (packer unpackUint8: self encodedUint8) equals: self decodedUint8.
