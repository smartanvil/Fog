packing test
testMaximalPackInt64
	self assert: (packer packInt64: self maximalDecodedInt64) equals: self maximalEncodedInt64
