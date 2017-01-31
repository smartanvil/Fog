as yet unclassified
printOn: aStream
	accessable printOn: aStream.
	aStream nextPut: $..
	member printOn: aStream