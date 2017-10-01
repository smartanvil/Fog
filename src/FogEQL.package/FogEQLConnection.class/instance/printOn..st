printing
printOn: aStream
	^ aStream
		nextPutAll: name printString;
		nextPutAll: ' ';
		nextPutAll: url printString