values
testArrayExampleHas3Items
	| arrayValue |
	arrayValue := (mirror property: #arrayExample) value: contract.
	arrayValue inspect.
	self assert: arrayValue size equals: 3