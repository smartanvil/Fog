unpackin tests
testMinimalUnpackAddress
	self assert: (packer unpackAddress: self minimalEncodedAddress) equals: self minimalDecodedAddress.
