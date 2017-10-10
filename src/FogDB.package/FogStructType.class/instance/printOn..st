printing
printOn: aStream
	aStream
		nextPutAll: self name;
		nextPutAll: '('.
	fields do: [ :f | f printOn: aStream. aStream nextPutAll: ' ' ].
	aStream nextPutAll: ')'.