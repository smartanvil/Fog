unpackin tests
testMaximalUnpackAddress
	self assert: (packer unpackAddress: self maximalEncodedAddress) equals: self maximalDecodedAddress
