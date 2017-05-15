packing test
testMaximalPackUint256
	self assert: (packer packUint256: self maximalDecodedUint256) equals: self maximalEncodedUint256
