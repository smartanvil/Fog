cache management
detectContractDescriptions: aBlock ifNoneCreate: aBlockInitialized
	^ self privateOnCacheCollection: #contractDescriptions detect: aBlock ifNoneCreate: aBlockInitialized