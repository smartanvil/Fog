packing test
testMaximalPackUint64
	self assert: (packer packUint64: self maximalDecodedUint64) equals: self maximalEncodedUint64
