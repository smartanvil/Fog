printing
printString
	| stream |
	stream := String new writeStream.
	stream nextPutAll: super printString.
	accesses
		do: [ :a | 
			stream
				nextPut: $.;
				nextPutAll: a printString ].
	^ stream contents 