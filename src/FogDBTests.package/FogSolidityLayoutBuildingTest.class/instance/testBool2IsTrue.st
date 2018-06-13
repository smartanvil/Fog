values
testBool2IsTrue
	self assert: ((mirror property: #bool2)  using: session value: contract at: #latest) equals: true