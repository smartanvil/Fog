as yet unclassified
printOn: aStream
	^ (self signature copyReplaceAll: 'function' with: 'function ' , name) printOn: aStream