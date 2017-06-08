printing
printOn: aStream
	aStream
		nextPutAll: String crlf;
		nextPutAll: '^ '.
	returns printOn: aStream.
	aStream nextPutAll: String crlf