printing
printOn: aStream
	^ aStream
		nextPutAll: amount asString;
		nextPutAll: ' ';
		nextPutAll: unit asString