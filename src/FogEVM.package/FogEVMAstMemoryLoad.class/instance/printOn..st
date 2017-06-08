printing
printOn: aStream
	aStream nextPutAll: '(memory at:'.
	fromAddress printOn: aStream.
	aStream nextPutAll: ' read: '.
	amountOfBytes printOn: aStream.
	aStream nextPutAll: ') '