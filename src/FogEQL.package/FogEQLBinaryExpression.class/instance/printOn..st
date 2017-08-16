printing
printOn: aStream
	aStream
		nextPutAll: left asString;
		nextPutAll: ' ';
		nextPutAll: operation asString;
		nextPutAll: ' ';
		nextPutAll: right asString 