printing
printOn: aStream
	aStream
		nextPutAll: left asString;
		nextPutAll: ' ';
		nextPutAll: self operation;
		nextPutAll: ' ';
		nextPutAll: right asString 