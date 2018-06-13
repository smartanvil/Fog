values
testArrayExampleHasStructsWithDictionariesContent
	| arrayValue expected |
	arrayValue := (mirror property: #arrayExample)  using: session value: contract at: #latest.
	expected := {{(#boolean -> true).
	(#uservalue -> 'A').
	(#commonvalue -> 134)} asDictionary .
	{(#boolean -> false).
	(#uservalue -> 'B').
	(#commonvalue -> 235)} asDictionary .
	{(#boolean -> true).
	(#uservalue -> 'C').
	(#commonvalue -> 34)} asDictionary }.
	self assert: arrayValue equals: expected