unpackin tests
testMaximalUnpackUint64
	self assert: (packer unpackUint64: self maximalEncodedUint64) equals: self maximalDecodedUint64
