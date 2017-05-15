unpackin tests
testMinimalUnpackInt
	self assert: (packer unpackInt: self minimalEncodedInt) equals: self minimalDecodedInt.
