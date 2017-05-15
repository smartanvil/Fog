packing test
testMinimalPackUint256
	self assert: (packer packUint256: self minimalDecodedUint256) equals: self minimalEncodedUint256.
