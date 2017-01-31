tests
testContractViewerOnSimpleStorageValuesAreTheExpected
	| mirror |
	mirror := simpleStorage contract mirror.
	self assert: (mirror property: '_owner' at: simpleStorage) value equals: self ownerAccountAddress.
	self assert: (mirror property: 'test2' at: simpleStorage) value equals: true.
	self assert: (mirror property: 'storedData' at: simpleStorage) value equals: 2