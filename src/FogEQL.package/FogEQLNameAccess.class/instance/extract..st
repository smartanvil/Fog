as yet unclassified
extract: aCollection
	^ accesses
		inject: (value extract: aCollection)
		into: [ :ex :access | access perform: #innerExtract: withArguments: {ex} ]