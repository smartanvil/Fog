packing test
testMinimalPackInt8
	self assert: (packer packInt8: self minimalDecodedInt8) equals: self minimalEncodedInt8.
