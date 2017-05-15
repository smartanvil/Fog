packing test
testMinimalPackInt32
	self assert: (packer packInt32: self minimalDecodedInt32) equals: self minimalEncodedInt32.
