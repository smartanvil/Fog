unpackin tests
testMaximalUnpackUint256
	self assert: (packer unpackUint256: self maximalEncodedUint256) equals: self maximalDecodedUint256
