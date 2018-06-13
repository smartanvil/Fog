values
testMidintIs32
	self assert: ((mirror property: #midint)  using: session value: contract at: #latest ) equals: 32