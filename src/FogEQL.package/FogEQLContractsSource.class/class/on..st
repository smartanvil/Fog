as yet unclassified
on: aString
	^ self new
		connection: (FogCachedConnection on: aString);
		yourself