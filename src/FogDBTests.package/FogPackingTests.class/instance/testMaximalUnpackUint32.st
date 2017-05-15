unpackin tests
testMaximalUnpackUint32
	self assert: (packer unpackUint32: self maximalEncodedUint32) equals: self maximalDecodedUint32
