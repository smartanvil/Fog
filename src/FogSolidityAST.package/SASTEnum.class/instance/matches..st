as yet unclassified
matches: aString
	^ ([ (aString indexOf: self name) = 1 ] || [ aString = name ]
		|| [ ('type(' , self name , ')') = aString ]) value