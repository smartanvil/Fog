packing test
testMaximalPackUint16
	self assert: (packer packUint16: self maximalDecodedUint16) equals: self maximalEncodedUint16
