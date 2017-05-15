unpackin tests
testMinimalUnpackInt16
	self assert: (packer unpackInt16: self minimalEncodedInt16) equals: self minimalDecodedInt16.
