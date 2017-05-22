printing
printBinaryOn: aStream
	super printBinaryOn: aStream.
	aStream nextPutAll: (parameter copyReplaceAll: '0x' with: '')