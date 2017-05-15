unpackin tests
testUnpackAddress
	self assert: (packer unpackAddress: self encodedAddress) equals: self decodedAddress.
