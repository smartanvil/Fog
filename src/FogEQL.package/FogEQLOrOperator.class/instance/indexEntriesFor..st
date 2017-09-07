printing
indexEntriesFor: aCollection 
	^ (left indexEntriesFor: aCollection) union: (right indexEntriesFor: aCollection)