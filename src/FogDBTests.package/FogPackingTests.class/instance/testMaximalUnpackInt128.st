unpackin tests
testMaximalUnpackInt128
	self assert: (packer unpackInt128: self maximalEncodedInt128) equals: self maximalDecodedInt128
