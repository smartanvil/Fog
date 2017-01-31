as yet unclassified
printOn: aStream
	^ aStream
		nextPutAll: 'mapping(';
		nextPutAll: keyType name;
		nextPutAll: '=>';
		nextPutAll: valueType name;
		nextPutAll: ')'