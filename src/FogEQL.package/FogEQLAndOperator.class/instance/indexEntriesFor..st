as yet unclassified
indexEntriesFor: aCollection 
	^ (left indexEntriesFor: aCollection) intersection: (right indexEntriesFor: aCollection)