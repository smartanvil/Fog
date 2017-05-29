accessing
storeChunck: anHexaChunk startingAt: anAddress ensureBytes: ammountOfBytes
	| address stream |
	address := anAddress asBKNumber.
	stream := anHexaChunk readStream.
	self assert: anHexaChunk size / 2 = ammountOfBytes.
	address to: ammountOfBytes  do: [ :i | self store: '0x' , (stream next: 2) at: (address + i) asBKHexa ]