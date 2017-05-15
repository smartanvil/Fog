unpackin tests
testMinimalUnpackUint
	self assert: (packer unpackUint: self minimalEncodedUint) equals: self minimalDecodedUint.
