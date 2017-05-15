packing test
testMaximalPackUint32
	self assert: (packer packUint32: self maximalDecodedUint32) equals: self maximalEncodedUint32
