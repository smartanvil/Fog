as yet unclassified
printOn: aStream
	aStream nextPutAll: 'var '.
	self type printOn: aStream.
	aStream nextPutAll: name.
	aStream nextPutAll: ' defaultValue: '.
	initialValue printOn: aStream