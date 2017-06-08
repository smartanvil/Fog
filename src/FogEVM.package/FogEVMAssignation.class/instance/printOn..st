printing
printOn: aStream
	variable name printOn: aStream.
	aStream nextPutAll: ' := '.
	value printOn: aStream