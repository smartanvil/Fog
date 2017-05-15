packing test
testMaximalPackInt8
	self assert: (packer packInt8: self maximalDecodedInt8) equals: self maximalEncodedInt8
