printing
printOn: aStream
	| write |
	write := '' writeStream.
	write nextPutAll: String crlf.
	body printOn: write.
	aStream nextPutAll: '('.
	condition printOn: aStream.
	aStream nextPutAll: ') ifTrue: [ '.
	aStream nextPutAll: String crlf.
	write contents lines
		do: [ :l | 
			aStream nextPutAll: String tab.
			aStream nextPutAll: l.
			aStream nextPutAll: String crlf ].
	aStream nextPutAll: ']. '.
	aStream nextPutAll: String crlf