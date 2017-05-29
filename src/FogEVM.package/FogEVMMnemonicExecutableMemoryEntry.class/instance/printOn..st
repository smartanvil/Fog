printing
printOn: aStream
	aStream
		nextPutAll: (byteNumber asBKHexa: 8);
		nextPutAll: ' - ';
		nextPutAll: instruction asString