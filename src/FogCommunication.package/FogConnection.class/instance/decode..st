converting
decode: aString
	^ (NeoJSONReader on: aString readStream) next