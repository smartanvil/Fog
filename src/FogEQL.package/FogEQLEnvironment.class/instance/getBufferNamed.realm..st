as yet unclassified
getBufferNamed: aString realm: aFogConnection 
	^ namedbuffers at: aString ifAbsent: [ Error signal: ' Buffer  ', aString, ' does not exist ' ].