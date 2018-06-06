tests
testSetSimpleArray
	self assert: 'b1cce7209640ba436319fe7fc15c64da53923aae2d101b92e0cc6b981de62acc' equals: (Keccak hashMessage: 'setSimpleArray(int256[])')asByteArray hex