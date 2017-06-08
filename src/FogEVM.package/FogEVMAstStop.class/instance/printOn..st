printing
printOn: aStream
	aStream
		nextPutAll: String crlf;
		nextPutAll: 'STOP ';
		nextPutAll: (address byteNumber asBKHexa: 8);
		nextPutAll: String crlf