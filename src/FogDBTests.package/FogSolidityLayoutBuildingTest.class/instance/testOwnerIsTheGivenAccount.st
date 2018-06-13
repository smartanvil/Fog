values
testOwnerIsTheGivenAccount
	self assert: ((mirror property: #_owner) using: session value: contract at: #latest) equals: self ownerAccountAddress