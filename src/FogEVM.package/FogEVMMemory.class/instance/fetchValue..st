as yet unclassified
fetchValue: aString
	^ layout at: aString ifAbsent: [ (layout associations detect: [ :a | a key asBKNumber = aString asBKNumber ] ifNone: [ layout at: aString put: 0 asBKHexa ]) value ]