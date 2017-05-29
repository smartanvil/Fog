converting
toBinary
	^ '0x'
		,
			((sequence collect: #instruction)
				inject: OrderedCollection new  writeStream
				into: [ :acc :each | 
					each printBinaryOn: acc.
					acc ]) contents asByteArray 