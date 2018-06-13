accessing
testArrayProperty
	self assert: ((mirror property: #array)  using: session value: contract address at: #latest) equals: {1 . 2 . 3}