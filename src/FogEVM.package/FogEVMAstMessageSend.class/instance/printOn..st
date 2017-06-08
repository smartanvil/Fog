printing
printOn: aStream
	aStream nextPutAll: '( '.
	receiver printOn: aStream.
	arguments size = 0
		ifTrue: [ selector asString printOn: aStream ]
		ifFalse: [ | pieces |
			pieces := (':' split: selector) reject: #isEmpty.
			pieces
				with: arguments
				do: [ :sel :arg | 
					aStream
						nextPutAll: ' ';
						nextPutAll: sel asString;
						nextPutAll: ': '.
					arg printOn: aStream ] ].
	aStream nextPutAll: ' )'