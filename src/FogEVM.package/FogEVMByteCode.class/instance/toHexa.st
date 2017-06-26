converting
toHexa
	^ '0x'
		,
			((content collect: #instruction)
				inject: '' writeStream
				into: [ :acc :each | 
					each printHexaOn: acc.
					acc ]) contents