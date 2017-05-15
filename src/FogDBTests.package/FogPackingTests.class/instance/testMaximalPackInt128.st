packing test
testMaximalPackInt128
	self assert: (packer packInt128: self maximalDecodedInt128) equals: self maximalEncodedInt128
