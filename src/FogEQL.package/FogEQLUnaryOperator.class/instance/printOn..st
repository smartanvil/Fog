printing
printOn: aStream
	aStream
		nextPutAll: self operation;
		nextPutAll: ' '.
	expression printOn: aStream