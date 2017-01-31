accessing
printOn: aStream
	^ aStream
		nextPutAll: type name;
		nextPutAll: ' ';
		nextPutAll: name