unpackin tests
testMaximalUnpackInt
	self assert: (packer unpackInt: self maximalEncodedInt) equals: self maximalDecodedInt
