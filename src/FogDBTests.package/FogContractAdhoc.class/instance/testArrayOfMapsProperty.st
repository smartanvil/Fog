accessing
testArrayOfMapsProperty
	self assert: ((mirror property: #arrayOfMaps) using: session value: contract  at: #latest) size equals: 0