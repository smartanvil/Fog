unpackin tests
testMaximalUnpackInt256
	self assert: (packer unpackInt256: self maximalEncodedInt256) equals: self maximalDecodedInt256
