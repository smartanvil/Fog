values
testMappingExampleTest1
	| dictionary |
	dictionary := (mirror property: #mappingExample) value: contract.
	self
		assert: (dictionary at: 2)
		equals:
			{(#boolean -> true).
			(#uservalue -> 'C').
			(#commonvalue -> 34)} asDictionary