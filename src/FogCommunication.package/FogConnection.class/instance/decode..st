as yet unclassified
decode: aString
	^ (NeoJSONReader on: aString readStream) next