packing test
testMaximalPackInt16
	self assert: (packer packInt16: self maximalDecodedInt16) equals: self maximalEncodedInt16
