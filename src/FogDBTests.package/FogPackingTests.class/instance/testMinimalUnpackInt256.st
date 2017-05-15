unpackin tests
testMinimalUnpackInt256
	self assert: (packer unpackInt256: self minimalEncodedInt256) equals: self minimalDecodedInt256.
