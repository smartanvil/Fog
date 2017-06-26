converting
toBinary
	^ '0x'
		,
			((content collect: #instruction)
				inject: OrderedCollection new  writeStream
				into: [ :acc :each | 
					each printBinaryOn: acc.
					acc ]) contents asByteArray 