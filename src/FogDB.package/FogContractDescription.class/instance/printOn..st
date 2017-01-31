printing
printOn: aStream
	^ aStream
		nextPutAll: 'Contract ';
		nextPutAll: (name ifNil: [ 'Unknown' ])