cache management
detectAccount: aBlock ifNoneCreate: aBlockInitialized
	^ self privateOnCacheCollection: #accounts detect: aBlock ifNoneCreate: aBlockInitialized