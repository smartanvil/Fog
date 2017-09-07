as yet unclassified
getBufferNamed: aString 
	^ namedbuffers at: aString ifAbsent: [ Error signal: ' Buffer  ', aString, ' does not exist ' ].