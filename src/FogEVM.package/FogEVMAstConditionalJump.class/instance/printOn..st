testing
printOn: aStream
	aStream nextPutAll: '('.
	condition printOn: aStream.
	aStream nextPutAll: ') ifTrue: [ interpreter jumpTo: '.
	address  printOn: aStream.
	aStream nextPutAll: '] '