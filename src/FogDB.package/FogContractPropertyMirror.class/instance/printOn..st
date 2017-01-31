printing
printOn: aStream
	aStream
		nextPutAll: 'Property ';
		nextPutAll: type name;
		nextPutAll: ' ';
		nextPutAll: name