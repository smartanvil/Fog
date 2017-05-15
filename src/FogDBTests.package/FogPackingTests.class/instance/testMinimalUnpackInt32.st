unpackin tests
testMinimalUnpackInt32
	self assert: (packer unpackInt32: self minimalEncodedInt32) equals: self minimalDecodedInt32.
