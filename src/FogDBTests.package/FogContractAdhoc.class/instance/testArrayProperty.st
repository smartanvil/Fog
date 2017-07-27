accessing
testArrayProperty
	self assert: ((mirror property: #array) value: contract) equals: {1 . 2 . 3}