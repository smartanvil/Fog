values
testOwnerIsTheGivenAccount
	self assert: ((mirror property: #_owner) value: contract) equals: self account