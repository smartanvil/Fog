unpackin tests
testMinimalUnpackInt8
	self assert: (packer unpackInt8: self minimalEncodedInt8) equals: self minimalDecodedInt8.
