printing
printOn: aStream
	aStream nextPutAll: '( '.
	receiver printOn: aStream.
	aStream nextPutAll: ' ' , selector asString , ' '.
	self argument printOn: aStream.
	aStream nextPutAll: ') '