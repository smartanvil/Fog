cache management
detectContract: aBlock ifNoneCreate: aBlockInitialized
	^ self privateOnCacheCollection: #contracts detect: aBlock ifNoneCreate: aBlockInitialized