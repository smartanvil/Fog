unpackin tests
testUnpackUint256
	self assert: (packer unpackUint256: self encodedUint256) equals: self decodedUint256.
