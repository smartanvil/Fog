printing
printOn: aStream
	aStream nextPutAll: '(storage at: '.
	address printOn: aStream.
	aStream nextPutAll: ' put: '.
	value printOn: aStream.
	aStream nextPutAll: ' )'