packing test
testMaximalPackUint8
	self assert: (packer packUint8: self maximalDecodedUint8) equals: self maximalEncodedUint8
