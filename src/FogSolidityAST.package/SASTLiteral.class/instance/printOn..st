as yet unclassified
printOn: aStream
	aStream
		nextPutAll: '(';
		nextPutAll: type name;
		nextPutAll: ')'.
	value printOn: aStream