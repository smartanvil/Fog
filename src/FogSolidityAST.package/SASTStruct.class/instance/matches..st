as yet unclassified
matches: aString
	
	^ ([ (aString indexOfSubCollection: self name) = 1 ] || [ aString = name ]
		|| [ ('type(' , self name , ')') = (aString copyReplaceAll: ' storage pointer' with: '') ])
		value