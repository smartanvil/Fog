printing
printOn: aStream
	aStream nextPutAll: '(memory at:'.
	address printOn: aStream.
	aStream nextPutAll: ' put: '.
	value printOn: aStream.
	aStream nextPutAll: ')'.