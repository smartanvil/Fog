packing test
testMinimalPackInt16
	self assert: (packer packInt16: self minimalDecodedInt16) equals: self minimalEncodedInt16.
