convenience - register
register: anObject into: aCacheTag
	^ (self privateWritableCache: aCacheTag) add: anObject