packing test
testPackString
	self assert: (FogStringType new pack: self decodedString using: packer) equals: self encodedString