printing
printOn: aStream
	aStream nextPutAll: 'SELF-DESTRUCT Account: '.
	account printOn: aStream.
	aStream
		nextPutAll: ' I: ';
		nextPutAll: (instruction byteNumber asBKHexa: 8)