values
testArrayExampleHas3Items
	| arrayValue |
	arrayValue := (mirror property: #arrayExample) value: contract.
	self assert: arrayValue size equals: 3