as yet unclassified
matches: aString
	^ (aString indexOfSubCollection: 'struct ' , name) = 1
		or: [ (aString indexOfSubCollection: 'enum ' , name) = 1 ]