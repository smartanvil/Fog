values
testBool1IsTrue
	self assert: ((mirror property: #bool1)  using: session value: contract at: #latest) equals: true