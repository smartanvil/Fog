unpackin tests
testMinimalUnpackBool
	self assert: (packer unpackBool: self minimalEncodedBool) equals: self minimalDecodedBool.
