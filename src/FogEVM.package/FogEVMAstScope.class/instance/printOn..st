printing
printOn: aStream
	aStream nextPutAll: ' |'.
	temporaries
		do: [ :t | 
			aStream
				nextPutAll: ' ';
				nextPutAll: t name;
				nextPutAll: ' ' ].
	aStream nextPutAll: '| '.
	aStream nextPutAll: String crlf.
	sequence printOn: aStream