as yet unclassified
printOn: aStream
	^ ('Fileloaded contract {1} ' format: {fromFile asFileReference basename})
		printOn: aStream