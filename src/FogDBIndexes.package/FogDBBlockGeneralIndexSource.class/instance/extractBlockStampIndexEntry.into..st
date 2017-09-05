stamp-indexing
extractBlockStampIndexEntry: anInteger into: aCollection
	| data |
	data := blocks at: anInteger.
	aCollection
		at: anInteger
		put:
			{(data at: 4).
			(data at: 1)}.