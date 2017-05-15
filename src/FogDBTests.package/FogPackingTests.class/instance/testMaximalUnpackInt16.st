unpackin tests
testMaximalUnpackInt16
	self assert: (packer unpackInt16: self maximalEncodedInt16) equals: self maximalDecodedInt16
