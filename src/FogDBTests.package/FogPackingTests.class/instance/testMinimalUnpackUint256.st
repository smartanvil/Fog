unpackin tests
testMinimalUnpackUint256
	self assert: (packer unpackUint256: self minimalEncodedUint256) equals: self minimalDecodedUint256.
