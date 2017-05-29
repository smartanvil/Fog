printing
printHexaOn: aStream
	super printHexaOn: aStream.
	aStream nextPutAll: (parameter copyReplaceAll: '0x' with: '')