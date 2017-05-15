unpackin tests
testMinimalUnpackInt128
	self assert: (packer unpackInt128: self minimalEncodedInt128) equals: self minimalDecodedInt128.
