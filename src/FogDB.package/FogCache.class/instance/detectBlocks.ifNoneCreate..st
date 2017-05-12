cache management
detectBlocks: aBlock ifNoneCreate: aBlockInitialized
	^ self privateOnCacheCollection: #blocks detect: aBlock ifNoneCreate: aBlockInitialized