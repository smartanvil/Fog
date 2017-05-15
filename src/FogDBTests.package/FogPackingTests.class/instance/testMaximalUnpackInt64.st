unpackin tests
testMaximalUnpackInt64
	self assert: (packer unpackInt64: self maximalEncodedInt64) equals: self maximalDecodedInt64
