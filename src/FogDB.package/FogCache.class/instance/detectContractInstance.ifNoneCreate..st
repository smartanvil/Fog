cache management
detectContractInstance: aBlock ifNoneCreate: aBlockInitialized
	^ self privateOnCacheCollection: #contractInstances detect: aBlock ifNoneCreate: aBlockInitialized