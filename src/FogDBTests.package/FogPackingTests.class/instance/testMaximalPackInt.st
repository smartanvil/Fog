packing test
testMaximalPackInt
	self assert: (packer packInt: self maximalDecodedInt) equals: self maximalEncodedInt
