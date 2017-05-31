printing
printOn: aStream
	aStream
		nextPutAll: (byteNumber asBKHexa: 8);
		nextPutAll: ' - ';
		nextPutAll: (instruction asString padRightTo: 50 with: Character space) ;
		nextPutAll: ' (';
		nextPutAll: instruction class comment;
		nextPutAll: ')'