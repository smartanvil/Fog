as yet unclassified
newCachedIfNotDetected: aBlock
	^ self instances detect: aBlock ifNone: [ self cachedNew ]