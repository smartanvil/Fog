packing test
testMinimalPackInt
	self assert: (packer packInt: self minimalDecodedInt) equals: self minimalEncodedInt.
