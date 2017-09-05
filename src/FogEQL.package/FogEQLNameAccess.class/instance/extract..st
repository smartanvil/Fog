as yet unclassified
extract: aCollection
	^ accesses
		inject: (super extract: aCollection)
		into: [ :ex :access | access perform: #innerExtract: withArguments: {ex} ]