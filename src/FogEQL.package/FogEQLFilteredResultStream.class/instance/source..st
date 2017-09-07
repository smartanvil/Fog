accessing
source: aSource
	super source: aSource.
	self index: {(filter indexEntriesFor: aSource) readStream}