printing
printOn: aStream
	aStream
		nextPutAll: receiver printString;
		nextPutAll: '.';
		nextPutAll: selector printString;
		nextPutAll: '(';
		nextPutAll: (',' join: arguments);
		nextPutAll: ')'