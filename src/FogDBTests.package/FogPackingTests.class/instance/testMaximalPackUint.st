packing test
testMaximalPackUint
	self assert: (packer packUint: self maximalDecodedUint) equals: self maximalEncodedUint
