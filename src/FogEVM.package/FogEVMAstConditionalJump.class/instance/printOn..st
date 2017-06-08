testing
printOn: aStream
	aStream nextPutAll: '('.
	condition printOn: aStream.
	aStream nextPutAll: ') ifTrue: [ interpreter jumpTo: '.
	address literalValue printOn: aStream.
	aStream nextPutAll: '] '