tests
testContractViewerOnSimpleStorageTypes
	| mirror |
	mirror := simpleStorage contract mirror instanceMirror.
	self assert: (mirror properties at: 1) type name equals: 'address'.
	self assert: (mirror properties at: 2) type name equals: 'uint256'.
	self assert: (mirror properties at: 3) type name equals: 'bool'