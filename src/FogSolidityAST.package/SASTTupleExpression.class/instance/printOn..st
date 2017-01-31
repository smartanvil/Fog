as yet unclassified
printOn: aStream
	aStream nextPutAll: 'tuple('.
	entries do: [ :e | aStream nextPutAll: e name ].
	aStream nextPutAll: ')'