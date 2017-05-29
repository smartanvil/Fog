printing
printBinaryOn: aStream
	| stream |
	super printBinaryOn: aStream.
	stream := (parameter copyReplaceAll: '0x' with: '') readStream.
	[ stream atEnd ] whileFalse: [ aStream nextPut: (stream next: 2) asBKNumber ]