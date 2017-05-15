unpackin tests
testMinimalUnpackUint8
	self assert: (packer unpackUint8: self minimalEncodedUint8) equals: self minimalDecodedUint8.
