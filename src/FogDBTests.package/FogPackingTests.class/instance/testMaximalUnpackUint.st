unpackin tests
testMaximalUnpackUint
	self assert: (packer unpackUint: self maximalEncodedUint) equals: self maximalDecodedUint
