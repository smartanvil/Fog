accessing
testArrayOfMapsProperty
	self assert: ((mirror property: #arrayOfMaps) value: contract) size equals: 0