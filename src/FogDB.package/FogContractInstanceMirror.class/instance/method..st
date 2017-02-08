as yet unclassified
method: aString
	^ self methods detect: [ :m | m selector = aString ]