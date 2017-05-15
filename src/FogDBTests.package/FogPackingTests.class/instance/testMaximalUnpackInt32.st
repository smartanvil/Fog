unpackin tests
testMaximalUnpackInt32
	self assert: (packer unpackInt32: self maximalEncodedInt32) equals: self maximalDecodedInt32
