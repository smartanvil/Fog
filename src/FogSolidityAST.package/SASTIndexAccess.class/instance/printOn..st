as yet unclassified
printOn: aStream
	indexable printOn: aStream.
	aStream
		nextPutAll: '[';
		nextPutAll: index name;
		nextPutAll: ']'