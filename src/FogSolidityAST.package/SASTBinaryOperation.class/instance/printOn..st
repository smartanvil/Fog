as yet unclassified
printOn: aStream
	left printOn: aStream.
	aStream nextPutAll: ' = '.
	right printOn: aStream