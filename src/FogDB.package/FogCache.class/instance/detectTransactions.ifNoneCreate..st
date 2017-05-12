cache management
detectTransactions: aBlock ifNoneCreate: aBlockInitialized
	^ self privateOnCacheCollection: #transactions detect: aBlock ifNoneCreate: aBlockInitialized