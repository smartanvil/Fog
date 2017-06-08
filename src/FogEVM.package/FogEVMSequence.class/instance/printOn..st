printing
printOn: aStream
	statements
		do: [ :s | 
			s printOn: aStream.
			aStream nextPut: $..
			aStream nextPutAll: String crlf ]