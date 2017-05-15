packing test
testMinimalPackInt64
	self assert: (packer packInt64: self minimalDecodedInt64) equals: self minimalEncodedInt64.
