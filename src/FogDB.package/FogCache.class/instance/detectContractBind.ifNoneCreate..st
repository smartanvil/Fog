cache management
detectContractBind: aBlock ifNoneCreate: aBlockInitialized
	^ self privateOnCacheCollection: #contractBinds detect: aBlock ifNoneCreate: aBlockInitialized