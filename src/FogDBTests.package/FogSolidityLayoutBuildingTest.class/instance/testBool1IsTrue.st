values
testBool1IsTrue
	self assert: ((mirror property: #bool1) value: contract) equals: true