unpackin tests
testMinimalUnpackInt64
	self assert: (packer unpackInt64: self minimalEncodedInt64) equals: self minimalDecodedInt64.
