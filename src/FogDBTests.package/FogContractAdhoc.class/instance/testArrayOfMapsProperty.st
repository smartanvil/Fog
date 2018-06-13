accessing
testArrayOfMapsProperty
	self assert: ((mirror property: #arrayOfMaps) using: session value: contract address at: #latest) size equals: 0