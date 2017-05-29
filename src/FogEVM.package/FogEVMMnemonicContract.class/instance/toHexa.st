converting
toHexa
	^ '0x'
		,
			((sequence collect: #instruction)
				inject: '' writeStream
				into: [ :acc :each | 
					each printHexaOn: acc.
					acc ]) contents