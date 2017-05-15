unpackin tests
testMaximalUnpackUint8
	self assert: (packer unpackUint8: self maximalEncodedUint8) equals: self maximalDecodedUint8
