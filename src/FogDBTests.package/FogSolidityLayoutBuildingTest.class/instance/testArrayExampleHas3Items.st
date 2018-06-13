values
testArrayExampleHas3Items
	| arrayValue |
	arrayValue := (mirror property: #arrayExample)  using: session value: contract at: #latest.
	self assert: arrayValue size equals: 3