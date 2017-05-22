printing
printOn: aStream
	aStream
		nextPutAll: self mnemonic;
		nextPutAll: ' ';
		nextPutAll: parameter