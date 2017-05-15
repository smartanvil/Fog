unpackin tests
testMaximalUnpackInt8
	self assert: (packer unpackInt8: self maximalEncodedInt8) equals: self maximalDecodedInt8
