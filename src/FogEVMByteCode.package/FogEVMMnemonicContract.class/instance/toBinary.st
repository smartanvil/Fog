converting
toBinary
	^ '0x', (sequence
		inject: '' writeStream
		into: [ :acc :each | 
			each printBinaryOn: acc.
			acc ]) contents