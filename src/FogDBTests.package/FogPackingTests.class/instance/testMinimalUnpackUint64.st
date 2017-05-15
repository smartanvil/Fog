unpackin tests
testMinimalUnpackUint64
	self assert: (packer unpackUint64: self minimalEncodedUint64) equals: self minimalDecodedUint64.
