packing test
testMinimalPackInt256
	self assert: (packer packInt256: self minimalDecodedInt256) equals: self minimalEncodedInt256.
