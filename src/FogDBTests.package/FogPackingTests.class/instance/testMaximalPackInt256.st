packing test
testMaximalPackInt256
	self assert: (packer packInt256: self maximalDecodedInt256) equals: self maximalEncodedInt256
