packing test
testPackUint256
	self assert: (packer packUint256: self decodedUint256) equals: self encodedUint256.
