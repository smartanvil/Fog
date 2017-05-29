printing
printHexaOn: aStream
	aStream nextPutAll: (self byteCode copyReplaceAll: '0x' with: '')