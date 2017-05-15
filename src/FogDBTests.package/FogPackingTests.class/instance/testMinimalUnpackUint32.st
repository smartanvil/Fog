unpackin tests
testMinimalUnpackUint32
	self assert: (packer unpackUint32: self minimalEncodedUint32) equals: self minimalDecodedUint32.
