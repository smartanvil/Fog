tests
testContractViewerOnSimpleStorageRespectOrder
	| mirror |
	mirror := simpleStorage contract mirror. 
	self assert: (mirror properties at: 1) name equals: '_owner'.
	self assert: (mirror properties  at: 2) name equals: 'storedData'.
	self assert: (mirror properties at: 3) name equals: 'test2'.
