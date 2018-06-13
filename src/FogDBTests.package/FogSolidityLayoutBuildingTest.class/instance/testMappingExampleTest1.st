values
testMappingExampleTest1
	| dictionary |
	dictionary := (mirror property: #mappingExample)  using: session value: contract at: #latest.
	self
		assert: (dictionary at: 2)
		equals:
			{(#boolean -> true).
			(#uservalue -> 'C').
			(#commonvalue -> 34)} asDictionary