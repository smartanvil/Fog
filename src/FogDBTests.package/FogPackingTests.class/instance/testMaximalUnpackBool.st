unpackin tests
testMaximalUnpackBool
	self assert: (packer unpackBool: self maximalEncodedBool) equals: self maximalDecodedBool
