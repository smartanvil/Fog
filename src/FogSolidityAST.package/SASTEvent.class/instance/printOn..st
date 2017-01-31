as yet unclassified
printOn: aStream
	aStream nextPutAll: (self signature copyReplaceAll: 'function' with: 'event ' , name)