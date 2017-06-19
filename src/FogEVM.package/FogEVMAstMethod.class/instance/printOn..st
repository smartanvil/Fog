printing
printOn: aStream
	aStream nextPutAll: '>>'. 
	sequence printOn: aStream.
	aStream nextPutAll: String crlf