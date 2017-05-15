packing test
testMaximalPackInt32
	self assert: (packer packInt32: self maximalDecodedInt32) equals: self maximalEncodedInt32
