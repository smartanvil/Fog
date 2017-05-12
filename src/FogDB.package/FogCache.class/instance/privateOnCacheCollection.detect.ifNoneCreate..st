private
privateOnCacheCollection: aCacheTag detect: aBlock ifNoneCreate: aBlockInitialized
	| collection |
	collection := self cached: aCacheTag.
	^ collection detect: aBlock ifNone: [ self register: aBlockInitialized value into: aCacheTag ]